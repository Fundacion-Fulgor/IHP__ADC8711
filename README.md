# ADC8711

Single-technology IP library.

- doc/     : user documentation
- dependencies/ : sub-cells and blocks
- release/v.1.0.0 : immutable versioned deliveries

## Setup and Development
- Initialize submodules and install pre-commit hook: `./eda setup`
- Install hook on existing clones (hook only, without altering submodules): `./eda install-hooks`
- Verify Xschem path portability locally: `./eda check-paths [--staged]`

`./eda setup` initializes pinned submodules and installs the pre-commit hook. If submodules are already initialized, run `./eda install-hooks` to install or upgrade the hook without modifying submodules. The installer safely upgrades exact known earlier hook revisions (including the original checker-only hook and prototype fixer/checker hook), preserves custom hooks, symlinks, or custom `core.hooksPath`, and provides manual chaining instructions invoking the full tracked hook (`sh "$(git rev-parse --show-toplevel)/.githooks/pre-commit" || exit $?`).

The hook normalizes exact tracked absolute Xschem component references in staged `.sch` and `.sym` files to portable relative paths and verifies path rules.

### Fixer CLI
- `--staged`: inspects staged changes in the Git index (default mode).
- `--check`: read-only check mode; exits with failure if fixes are required without modifying files.
- `--all --check`: read-only full index scan across all tracked sources (requires `--check`).
- `--library-root <dir>`: specifies an explicit installed library search root for resolution (repeatable).

Safety and coverage rules:
- **Safe partial staging refusal**: the fixer refuses to overwrite files that have unstaged modifications or mode changes in the working tree when fixes are needed.
- **Never basename guess**: unresolved, ambiguous, or other-machine references require manual review or an explicit `--library-root`; the tool never guesses destinations from basename alone.
- **Automatic rewriting coverage**: strictly scoped to component references (`C {path} ...`) plus proven repository provenance comments in `.spice`/`.cir`.
- **Validation-only scope**: executable directives, embedded Tcl scripts, and complex attributes remain checker validation-only; they are never automatically rewritten.

## Contributing
See [CONTRIBUTING.md](.github/CONTRIBUTING.md) for naming conventions, path portability rules, and the upload guide.

## Using this repository
See [GITHUB-GUIDE.md](.github/GITHUB-GUIDE.md) for how to navigate Issues and Pull Requests on GitHub, and how to use correctly the git workflow.
