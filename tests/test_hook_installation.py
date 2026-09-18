import importlib.util
from importlib.machinery import SourceFileLoader
import io
import os
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

eda_path = Path(__file__).resolve().parent.parent / "eda"
loader = SourceFileLoader("eda", str(eda_path))
spec = importlib.util.spec_from_file_location("eda", eda_path, loader=loader)
eda = importlib.util.module_from_spec(spec)
spec.loader.exec_module(eda)


class TestHookInstallation(unittest.TestCase):
    def setUp(self):
        self.stdout_buf = io.StringIO()
        self.patch_stdout = patch("sys.stdout", self.stdout_buf)
        self.patch_stdout.start()
        self.temp_dir = tempfile.TemporaryDirectory()
        self.repo_dir = Path(self.temp_dir.name)
        subprocess.run(["git", "init", str(self.repo_dir)], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        self.githooks_dir = self.repo_dir / ".githooks"
        self.githooks_dir.mkdir()
        self.source_hook = self.githooks_dir / "pre-commit"
        self.source_hook.write_bytes((eda_path.parent / ".githooks" / "pre-commit").read_bytes())
        self.source_hook.chmod(0o755)

    def tearDown(self):
        self.patch_stdout.stop()
        self.temp_dir.cleanup()

    def test_safe_installation_fresh_repo(self):
        rc = eda.cmd_install_hooks(self.repo_dir)
        self.assertEqual(rc, 0)
        target = self.repo_dir / ".git" / "hooks" / "pre-commit"
        self.assertTrue(target.is_file())
        self.assertEqual(target.read_bytes(), self.source_hook.read_bytes())
        self.assertTrue(os.access(target, os.X_OK))

    def test_idempotence(self):
        rc1 = eda.cmd_install_hooks(self.repo_dir)
        self.assertEqual(rc1, 0)
        target = self.repo_dir / ".git" / "hooks" / "pre-commit"
        mtime1 = target.stat().st_mtime_ns

        rc2 = eda.cmd_install_hooks(self.repo_dir)
        self.assertEqual(rc2, 0)
        self.assertEqual(target.read_bytes(), self.source_hook.read_bytes())

    def test_existing_hook_preservation_and_chaining_notice(self):
        target = self.repo_dir / ".git" / "hooks" / "pre-commit"
        target.parent.mkdir(parents=True, exist_ok=True)
        custom_hook_content = b"#!/bin/sh\necho custom pre-commit\nexit 0\n"
        target.write_bytes(custom_hook_content)

        stderr_buf = io.StringIO()
        with patch("sys.stderr", stderr_buf):
            rc = eda.cmd_install_hooks(self.repo_dir)

        self.assertEqual(rc, 1)
        self.assertEqual(target.read_bytes(), custom_hook_content)
        err_msg = stderr_buf.getvalue()
        self.assertIn('sh "$(git rev-parse --show-toplevel)/.githooks/pre-commit" || exit $?', err_msg)

    def test_custom_hookspath_preservation(self):
        custom_dir = self.repo_dir / "custom_hooks"
        custom_dir.mkdir()
        subprocess.run(["git", "config", "core.hooksPath", str(custom_dir)], cwd=str(self.repo_dir), check=True)

        stderr_buf = io.StringIO()
        with patch("sys.stderr", stderr_buf):
            rc = eda.cmd_install_hooks(self.repo_dir)

        self.assertEqual(rc, 1)
        self.assertFalse((custom_dir / "pre-commit").exists())
        err_msg = stderr_buf.getvalue()
        self.assertIn('sh "$(git rev-parse --show-toplevel)/.githooks/pre-commit" || exit $?', err_msg)

    def test_custom_hookspath_pointing_to_project_githooks(self):
        subprocess.run(["git", "config", "core.hooksPath", ".githooks"], cwd=str(self.repo_dir), check=True)
        rc = eda.cmd_install_hooks(self.repo_dir)
        self.assertEqual(rc, 0)

    def test_worktree_installation(self):
        env = dict(os.environ, GIT_AUTHOR_NAME="Test User", GIT_AUTHOR_EMAIL="test@example.com", GIT_COMMITTER_NAME="Test User", GIT_COMMITTER_EMAIL="test@example.com")
        dummy_file = self.repo_dir / "README.md"
        dummy_file.write_text("test\n")
        subprocess.run(["git", "add", "README.md"], cwd=str(self.repo_dir), check=True)
        subprocess.run(["git", "commit", "-m", "init"], cwd=str(self.repo_dir), check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, env=env)

        wt_dir = Path(self.temp_dir.name) / "worktree"
        subprocess.run(["git", "worktree", "add", str(wt_dir), "-b", "wt-branch"], cwd=str(self.repo_dir), check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        wt_githooks = wt_dir / ".githooks"
        wt_githooks.mkdir(exist_ok=True)
        wt_hook = wt_githooks / "pre-commit"
        shutil.copy2(self.source_hook, wt_hook)

        rc = eda.cmd_install_hooks(wt_dir)
        self.assertEqual(rc, 0)
        target = self.repo_dir / ".git" / "hooks" / "pre-commit"
        self.assertTrue(target.is_file())
        self.assertEqual(target.read_bytes(), self.source_hook.read_bytes())

    def test_dangling_symlink_preserved_target_not_created(self):
        hooks_dir = self.repo_dir / ".git" / "hooks"
        hooks_dir.mkdir(parents=True, exist_ok=True)
        target = hooks_dir / "pre-commit"
        nonexistent = self.repo_dir / "external_nonexistent.sh"
        target.symlink_to(nonexistent)
        self.assertTrue(target.is_symlink())
        self.assertFalse(nonexistent.exists())

        stderr_buf = io.StringIO()
        with patch("sys.stderr", stderr_buf):
            rc = eda.cmd_install_hooks(self.repo_dir)

        self.assertEqual(rc, 1)
        self.assertTrue(target.is_symlink())
        self.assertFalse(nonexistent.exists())
        self.assertIn('sh "$(git rev-parse --show-toplevel)/.githooks/pre-commit" || exit $?', stderr_buf.getvalue())

    def test_matching_content_symlink_refused(self):
        hooks_dir = self.repo_dir / ".git" / "hooks"
        hooks_dir.mkdir(parents=True, exist_ok=True)
        target = hooks_dir / "pre-commit"
        external_file = self.repo_dir / "external_matching.sh"
        external_file.write_bytes(self.source_hook.read_bytes())
        target.symlink_to(external_file)
        self.assertTrue(target.is_symlink())

        stderr_buf = io.StringIO()
        with patch("sys.stderr", stderr_buf):
            rc = eda.cmd_install_hooks(self.repo_dir)

        self.assertEqual(rc, 1)
        self.assertTrue(target.is_symlink())
        self.assertIn('sh "$(git rev-parse --show-toplevel)/.githooks/pre-commit" || exit $?', stderr_buf.getvalue())

    def test_unrelated_existing_hooks_intact(self):
        hooks_dir = self.repo_dir / ".git" / "hooks"
        hooks_dir.mkdir(parents=True, exist_ok=True)
        commit_msg = hooks_dir / "commit-msg"
        commit_msg.write_bytes(b"#!/bin/sh\necho commit-msg\n")
        post_commit = hooks_dir / "post-commit"
        post_commit.write_bytes(b"#!/bin/sh\necho post-commit\n")

        rc = eda.cmd_install_hooks(self.repo_dir)
        self.assertEqual(rc, 0)
        target = hooks_dir / "pre-commit"
        self.assertTrue(target.is_file())
        self.assertEqual(commit_msg.read_bytes(), b"#!/bin/sh\necho commit-msg\n")
        self.assertEqual(post_commit.read_bytes(), b"#!/bin/sh\necho post-commit\n")

    def test_git_config_query_unexpected_exit_code_fails_closed(self):
        real_run = subprocess.run

        def side_effect(cmd, *args, **kwargs):
            if len(cmd) >= 3 and cmd[0] == "git" and cmd[1] == "config" and cmd[2] == "core.hooksPath":
                res = subprocess.CompletedProcess(cmd, 2)
                res.stdout = ""
                res.stderr = "fatal: bad config"
                return res
            return real_run(cmd, *args, **kwargs)

        stderr_buf = io.StringIO()
        with patch("subprocess.run", side_effect=side_effect):
            with patch("sys.stderr", stderr_buf):
                rc = eda.cmd_install_hooks(self.repo_dir)

        self.assertEqual(rc, 1)
        target = self.repo_dir / ".git" / "hooks" / "pre-commit"
        self.assertFalse(target.exists())

    def test_custom_hookspath_project_githooks_not_executable_fails(self):
        subprocess.run(["git", "config", "core.hooksPath", ".githooks"], cwd=str(self.repo_dir), check=True)
        self.source_hook.chmod(0o644)
        stderr_buf = io.StringIO()
        with patch("sys.stderr", stderr_buf):
            rc = eda.cmd_install_hooks(self.repo_dir)
        self.assertEqual(rc, 1)
        self.assertIn("no es ejecutable", stderr_buf.getvalue())

    def test_missing_source_hook(self):
        self.source_hook.unlink()
        stderr_buf = io.StringIO()
        with patch("sys.stderr", stderr_buf):
            rc = eda.cmd_install_hooks(self.repo_dir)
        self.assertEqual(rc, 1)

    def test_cmd_check_paths_missing_script(self):
        stderr_buf = io.StringIO()
        with patch("sys.stderr", stderr_buf):
            rc = eda.cmd_check_paths(self.repo_dir)
        self.assertEqual(rc, 1)

    def test_cmd_check_paths_forwarding(self):
        scripts_dir = self.repo_dir / "scripts"
        scripts_dir.mkdir()
        checker = scripts_dir / "check_xschem_paths.py"
        checker.write_text(
            "import sys\n"
            "flag_file = sys.argv[1] if len(sys.argv) > 1 else ''\n"
            "sys.exit(0 if '--staged' in sys.argv else 2)\n"
        )

        rc_unstaged = eda.cmd_check_paths(self.repo_dir, staged=False)
        self.assertEqual(rc_unstaged, 2)

        rc_staged = eda.cmd_check_paths(self.repo_dir, staged=True)
        self.assertEqual(rc_staged, 0)

    def test_setup_integration_installs_hook(self):
        real_run = subprocess.run

        def side_effect(cmd, *args, **kwargs):
            if len(cmd) >= 2 and cmd[0] == "git" and cmd[1] == "submodule":
                res = subprocess.CompletedProcess(cmd, 0)
                res.stdout = ""
                res.stderr = ""
                return res
            return real_run(cmd, *args, **kwargs)

        with patch("subprocess.run", side_effect=side_effect):
            rc = eda.cmd_setup(self.repo_dir)
            self.assertEqual(rc, 0)
        target = self.repo_dir / ".git" / "hooks" / "pre-commit"
        self.assertTrue(target.is_file())
        self.assertEqual(target.read_bytes(), self.source_hook.read_bytes())

    def test_tracked_githook_properties(self):
        tracked_hook = eda_path.parent / ".githooks" / "pre-commit"
        self.assertTrue(tracked_hook.is_file())
        self.assertTrue(os.access(tracked_hook, os.X_OK))

        lines = tracked_hook.read_text().splitlines()
        self.assertTrue(len(lines) >= 3)
        self.assertEqual(lines[0], "#!/bin/sh")
        self.assertEqual(lines[1], "set -eu")
        for line in lines[1:]:
            self.assertFalse(line.strip().startswith("#"))
        content = tracked_hook.read_text()
        self.assertIn("git rev-parse --show-toplevel", content)
        self.assertIn('"$root/scripts/fix_xschem_paths.py" --staged', content)
        self.assertIn('"$root/scripts/check_xschem_paths.py" --staged', content)

    def test_install_hooks_upgrades_known_hooks_and_preserves_custom_hook(self):
        target = self.repo_dir / ".git" / "hooks" / "pre-commit"
        target.parent.mkdir(parents=True, exist_ok=True)
        for old_hook in eda.KNOWN_OLD_HOOKS:
            with self.subTest(old_hook=old_hook):
                target.write_bytes(old_hook)
                target.chmod(0o755)
                self.assertEqual(eda.cmd_install_hooks(self.repo_dir), 0)
                self.assertEqual(target.read_bytes(), self.source_hook.read_bytes())
                self.assertTrue(os.access(target, os.X_OK))

        custom = b"#!/bin/sh\necho custom\nexit 0\n"
        target.write_bytes(custom)
        target.chmod(0o755)
        stderr = io.StringIO()
        with patch("sys.stderr", stderr):
            self.assertEqual(eda.cmd_install_hooks(self.repo_dir), 1)
        self.assertEqual(target.read_bytes(), custom)
        self.assertIn('sh "$(git rev-parse --show-toplevel)/.githooks/pre-commit" || exit $?', stderr.getvalue())

    def test_install_hooks_upgrade_write_error(self):
        target = self.repo_dir / ".git" / "hooks" / "pre-commit"
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(eda.KNOWN_OLD_HOOKS[0])
        target.chmod(0o755)
        stderr = io.StringIO()
        with patch.object(Path, "write_bytes", side_effect=OSError("read-only")):
            with patch("sys.stderr", stderr):
                self.assertEqual(eda.cmd_install_hooks(self.repo_dir), 1)
        self.assertIn("Error al actualizar hook", stderr.getvalue())

    def test_manual_hook_chaining_preserves_remainder_and_failure(self):
        scripts = self.repo_dir / "scripts"
        scripts.mkdir()
        (scripts / "fix_xschem_paths.py").write_text("import sys\nsys.exit(0)\n")
        checker = scripts / "check_xschem_paths.py"
        checker.write_text("import sys\nsys.exit(0)\n")
        custom = self.repo_dir / "custom-pre-commit"
        custom.write_text(
            "#!/bin/sh\n"
            "root=\"$(git rev-parse --show-toplevel)\"\n"
            "sh \"$root/.githooks/pre-commit\" || exit $?\n"
            "touch \"$root/custom-ran\"\n"
        )
        custom.chmod(0o755)

        success = subprocess.run(["sh", str(custom)], cwd=str(self.repo_dir))
        self.assertEqual(success.returncode, 0)
        self.assertTrue((self.repo_dir / "custom-ran").is_file())

        (self.repo_dir / "custom-ran").unlink()
        checker.write_text("import sys\nsys.exit(7)\n")
        failure = subprocess.run(["sh", str(custom)], cwd=str(self.repo_dir))
        self.assertEqual(failure.returncode, 7)
        self.assertFalse((self.repo_dir / "custom-ran").exists())

    def test_known_old_hooks_definitions(self):
        self.assertEqual(len(eda.KNOWN_OLD_HOOKS), 2)
        self.assertTrue(eda.KNOWN_OLD_HOOKS[0].startswith(b"#!/bin/sh\n"))
        self.assertNotIn(b"set -eu", eda.KNOWN_OLD_HOOKS[0])
        self.assertNotIn(b"fix_xschem_paths.py", eda.KNOWN_OLD_HOOKS[0])
        self.assertTrue(eda.KNOWN_OLD_HOOKS[1].startswith(b"#!/bin/sh\n"))
        self.assertNotIn(b"set -eu", eda.KNOWN_OLD_HOOKS[1])
        self.assertIn(b"fix_xschem_paths.py", eda.KNOWN_OLD_HOOKS[1])
        self.assertIn(b"set -eu", self.source_hook.read_bytes())

    def test_main_cli_install_hooks(self):
        with patch.object(eda, "get_repo_root", return_value=self.repo_dir):
            with patch("sys.stdout", io.StringIO()):
                rc = eda.main(["install-hooks"])
        self.assertEqual(rc, 0)
        target = self.repo_dir / ".git" / "hooks" / "pre-commit"
        self.assertTrue(target.is_file())

    def test_main_cli_check_paths(self):
        scripts_dir = self.repo_dir / "scripts"
        scripts_dir.mkdir()
        checker = scripts_dir / "check_xschem_paths.py"
        checker.write_text("import sys\nsys.exit(0 if '--staged' in sys.argv else 3)\n")
        with patch.object(eda, "get_repo_root", return_value=self.repo_dir):
            rc_unstaged = eda.main(["check-paths"])
            rc_staged = eda.main(["check-paths", "--staged"])
        self.assertEqual(rc_unstaged, 3)
        self.assertEqual(rc_staged, 0)


if __name__ == "__main__":
    unittest.main()
