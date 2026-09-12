# GitHub Guide — IHP__ADC8711

Quick reference for using this repository. For file naming rules and where each design file goes, see `CONTRIBUTING.md` — this guide covers GitHub navigation and the branch workflow.

## 1. What is GitHub

GitHub is the online platform hosting this repository. It lets the team store files, track pending work, and review changes before they become part of the project, accessible from anywhere without needing to be on the same machine.

## 2. Finding this repository

Once logged in, go to:
```
https://github.com/Fundacion-Fulgor/IHP__ADC8711.git
```

## 3. The Code tab

This is the main tab of the repository — it shows the current folder structure and files of `IHP__ADC8711`. The `README.md` (short project description) and `CONTRIBUTING.md` (naming and upload rules) are visible right here; read `CONTRIBUTING.md` before uploading anything.

## 4. The Issues tab

Use this to flag anything pending or wrong with the design files — a missing report, a naming mismatch, a question about which folder something belongs in. Example:

> "Top cell name in `netlist/layout/` doesn't match `ADC8711` — needs fixing before release."

Issues keep track of open problems so nothing gets lost between people working on different blocks of the converter.

## 5. The Pull Requests tab

A Pull Request (PR) proposes merging a branch's changes into `main`, so someone can review them first (correct name, correct folder, DRC/LVS reports present, etc.) instead of files landing on `main` unreviewed.

1. Push your branch (see section 7 below).
2. Open a Pull Request comparing your branch against `main`.
3. Whoever is reviewing checks the files against the `CONTRIBUTING.md` checklist, then approves or requests changes.
4. Once approved, the PR is merged into `main`.

Nobody pushes directly to `main` — every change goes through a branch and a PR first.

## 6. Setting up Git on your computer (once per person)

1. Install Git: https://git-scm.com/downloads (or via your OS package manager on Linux).
2. Set your identity:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your_email@example.com"
   ```
3. Generate an SSH key (skip if you already have one):
   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
   cat ~/.ssh/id_ed25519.pub
   ```
4. Add the printed key to GitHub: **Settings → SSH and GPG keys → New SSH key**.
5. Clone the repository:
   ```bash
   git clone git@github.com:Fundacion-Fulgor/IHP__ADC8711.git
   cd IHP__ADC8711
   ```

## 7. Working with branches

Every task gets its own branch, always created from `main`. Changes reach `main` only through a reviewed Pull Request — never push straight to `main`.

**Naming convention:**
```
type/short-description
```

| Type | Use for |
|---|---|
| `block/` | Adding or updating one design block (schematic, layout, netlist for a subcell) |
| `verify/` | Adding DRC, LVS, or PEX reports |
| `fix/` | Fixing a naming or path mismatch |
| `release/` | Preparing the final `release/v.1.0.0/` deliverables |
| `docs/` | Documentation-only changes (TRL doc, datasheet, specification) |

Examples:
```
block/gro-oscillator
block/adder-tree
verify/lvs-top-level
fix/netlist-layout-name
docs/trl-mixed-signal
```

Avoid accented letters (á, é, í, ó, ú) and ñ in branch names — keep them plain ASCII.

## 8. Everyday commands

**See which branch you're on:**
```bash
git branch
```

**Create and switch to a new branch (always starting from an up-to-date `main`):**
```bash
git switch main
git pull
git switch -c block/gro-oscillator
```

**Check what you've changed:**
```bash
git status
```

**Undo changes in a file you haven't committed yet:**
```bash
git restore <file>
```

**Stage and commit your changes:**
```bash
git add <file>
git commit -s -m "Add GRO oscillator schematic and AC testbench"
```

**Push your branch:**
```bash
git push -u origin block/gro-oscillator
```

Then open the Pull Request from that branch into `main` (section 5) — that's what actually gets it merged.
