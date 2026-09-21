# Naming and Upload Guide — IHP__ADC8711 (GRO-TDC)

**Repo:** `IHP__ADC8711` · **Category:** Mixed-Signal · **Subcategory:** ADC · **Top cell:** `ADC8711` · **Process:** IHP SG13G2

This guide is for anyone uploading design files to the repo. Follow it exactly: IHP's submission system validates names and paths automatically, and a wrong name will get the whole submission rejected.

---

## 1. Golden rule: only one name changes

The **top-level cell** (the complete chip, with all blocks integrated) must be named **`ADC8711`** EVERYWHERE:

- Top-level schematic → cell `ADC8711`
- Top-level layout (GDS) → cell `ADC8711`, file `ADC8711.gds`
- Top-level netlist → `ADC8711.spice` (or `.cdl`)

**Internal subcells keep their own names** — no need to touch them: the gated ring oscillator, the comparators/buffers, the SR latch, the D flip-flops, the counters, the adder tree, the output multiplexer — each one keeps whatever name it already has in the design. Only the top of the hierarchy gets renamed.

If someone isn't sure whether a file is "the top" or "a subcell": the top is the one that instantiates all the other blocks and has the external pins (START, STOP, CTRL[2:0], DECLK, RESET, OUTPUT, VDD, VSS).

---

## 2. Where each file goes

This whole structure already exists in the repo (the script generated it) — no need to create new folders, just copy files into the right one, inside `ADC8711-main/`.

| Folder | What goes there | Example name |
|---|---|---|
| `schematic/xschem/` | Top-level schematic + schematics for each subcell (GRO, comparators, SR latch, D flip-flops, adders, mux) | `ADC8711.sch`, `GRO.sch`, `dflipflop.sch`, etc. |
| `layout/klayout/` | Final layout, complete with pad ring, already DRC/LVS clean | `ADC8711.gds` |
| `netlist/schematic/` | Netlist exported from xschem (the "golden" reference) | `ADC8711.spice` or `.cdl` |
| `netlist/layout/` | Netlist extracted from the layout (the one compared against the one above in LVS) | `ADC8711.spice` |
| `netlist/pex/` | Netlist with post-layout parasitics, if available | `ADC8711_pex.spice` |
| `verification/drc/` | DRC report (per the report, already 100% clean) | `ADC8711.lyrdb` |
| `verification/lvs/` | LVS report (also 100% clean) | `ADC8711.lvsdb` |
| `testbenches/ac/xschem/` | AC characterization testbenches for the cells | as applicable |
| `testbenches/tran/xschem/` | Transient testbenches (the ones that produced Table 2 in the report: Δt, T_RO, counts, ~9% error) | as applicable |
| `testbenches/corners/xschem/` | Corner testbenches (if run) | as applicable |
| `timing/` | Timing notes: propagation delays and transition times from Table 1, maximum counting frequency | a `.md` or `.pdf` with that data |
| `layout/magic/`, `layout/lef/`, `layout/def/`, `model/spice/`, `model/verilog-A/`, `netlist/rcx/`, `testbenches/*/qucs-s/` | **Leave empty** — these are for tools this project didn't use (Magic, Verilog-A, qucs-s) | — |

---

## 3. How to upload files (git)

This repo includes the PDK (`IHP-Open-PDK`) and the IO-cell library (`openpdk-libraries`) as submodules, pinned to fixed commits for reproducibility — clone with `--recursive` so they come along:

```bash
git clone --recursive git@github.com:Fundacion-Fulgor/IHP__ADC8711.git
cd IHP__ADC8711
```

If you already had the repo cloned before submodules or hooks were introduced, run `./eda setup` to initialize submodules and install the pre-commit hook. On existing clones where submodules are already configured, run `./eda install-hooks` to install the pre-commit hook only (without touching submodules).

Each person uploading their part adds their files to the corresponding folder, and pushes:

```bash
cd IHP__ADC8711

# copy your own files into the corresponding folder under ADC8711-main/...

git add .
./eda check-paths --staged
git commit -s -m "Add <block>: brief description of what's being uploaded"
git push
```

Recommendation: one commit per block/delivery (e.g. "Add GRO schematic + AC testbench"), not one giant commit with everything at once — that way, if something breaks, you can track down which file caused it.

---

## 4. What NOT to touch

- **`doc/info.json`**: the general fields (category, process, license, sealring size, etc.) are handled by whoever is in charge of the repo. If someone needs a value added there, they should ask instead of editing it directly, to avoid conflicts between people uploading at the same time.
- **The folder structure**: don't create new folders or rename existing ones.
- **`release/v.1.0.0/`**: this folder only gets filled at the very end, with the final, frozen GDS and netlist. It's not where work in progress goes.

---

## 5. Checklist before each push

- [ ] The top cell is named `ADC8711` in the file I'm uploading (if it's a top-level view)
- [ ] The file is in the correct folder from the table in section 2
- [ ] The file name uses `ADC8711` if it's a top-level view (GDS, top netlist, DRC/LVS reports)
- [ ] Path portability verified (`git add .` then `./eda check-paths --staged` passes with no personal paths)
- [ ] I did not touch `doc/info.json` or the folder structure
- [ ] The commit message says which block/file is being added

---

## 6. Path portability and pre-commit checks

To ensure portability across different contributor workstations and CI environments, Xschem schematics (`.sch`) and symbols (`.sym`) must adhere to path portability rules:

- **Allowed references and valid contexts**:
  - **Bare symbols and library-relative names (default)**: Used for symbol and schematic instantiations (e.g. `Counters_6bits.sym`, `sg13g2_IOPadAnalog.sym`).
  - **`$netlist_dir`**: Valid in Tcl launcher scripts and netlist/raw output directory configuration.
  - **`$PDK_ROOT` / `$PDK`**: Valid only within `tcleval` SPICE model include and library directives.
  - **Prohibited**: Hardcoded personal user paths (such as `/home/username/...` or `/Users/...`).
- **Validation scope and automatic rewriting coverage**:
  - **Fixer automatic coverage**: Strictly scoped to component references (`C {path} ...`) in `.sch` and `.sym` files. Generated `.spice`/`.cir` comments, including `** sch_path:` and `** sym_path:`, are ignored and preserved byte-for-byte; absolute paths in comments do not cause check failures.
  - **Checker validation-only**: Executable directives, embedded Tcl scripts, and complex attributes remain checker validation-only and will never be automatically rewritten; never imply full automatic rewriting.
- **Fixer CLI interface**:
  - `--staged`: Normalizes staged changes in the Git index (default mode).
  - `--check`: Read-only verification mode that fails if fixes are needed without modifying files.
  - `--all --check`: Read-only full index scan across all tracked sources in the repository (requires `--check`).
  - `--library-root <dir>`: Explicit installed library search root for symbol resolution (repeatable for multiple roots).
- **Safety guarantees**:
  - **Safe partial staging refusal**: The fixer refuses to overwrite files that have unstaged working-tree modifications or mode changes when fixes are needed, protecting against accidental loss of uncommitted work.
  - **Never basename guess**: Unresolved, ambiguous, or other-machine paths require manual review or an explicit `--library-root`; the tool never guesses destinations from basename alone.
- **Hook automation and safe upgrades**:
  - Running `./eda setup` initializes submodules and automatically installs the shared Git pre-commit hook.
  - On existing clones, `./eda install-hooks` installs or safely upgrades the hook without modifying submodules.
  - The installer safely upgrades exact known earlier hook revisions (including the original checker-only hook and the prototype fixer/checker hook).
  - Existing custom pre-commit hooks, symlinks, and custom `core.hooksPath` configurations are preserved. When manual chaining is needed, a notice is emitted instructing contributors to invoke the full tracked hook:
    ```sh
    sh "$(git rev-parse --show-toplevel)/.githooks/pre-commit" || exit $?
    ```
- **Local checking**: Run `./eda check-paths` to inspect tracked files or `./eda check-paths --staged` to inspect staged changes after `git add`.
- **CI enforcement**: CI executes in read-only mode (`permissions: contents: read`), running `python3 scripts/fix_xschem_paths.py --all --check`, followed by `python3 scripts/check_xschem_paths.py` and the unit test suite. Because local Git hooks can be bypassed (e.g., via `git commit --no-verify`), repository administrators should configure the `Xschem path portability` CI workflow job as a required status check in GitHub branch protection rules (a manual admin setting).
