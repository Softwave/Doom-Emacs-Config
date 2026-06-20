# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal Doom Emacs configuration. The Doom installation itself lives at `~/.config/emacs/` (a separate git repo). This directory (`~/.config/doom/`) is the user config layer that Doom loads on top.

Evil/vim mode is **disabled**. CUA mode is enabled (Ctrl+C/V/Z behave as expected). The overall aesthetic is retro: IBM BIOS bitmap font, black modeline, nyan-mode, no bold/italic font rendering.

## Key CLI commands

```bash
doom sync       # Run after editing init.el or packages.el — installs/removes packages
doom upgrade    # Upgrades Doom itself; only do intentionally, can be breaking
doom doctor     # Diagnoses common config problems — run this when something breaks
doom env        # Regenerates environment variable snapshot (fix PATH issues etc.)
```

`doom sync` is safe and reversible. `doom upgrade` is the risky one.

## How to add packages

**Never use `M-x package-install`** — it bypasses straight.el and corrupts the lockfile.

| What you want | How to do it |
|---|---|
| Enable a Doom module (batteries-included) | Uncomment it in `init.el`, run `doom sync` |
| Add a package from MELPA/GitHub | Add `(package! name)` to `packages.el`, run `doom sync` |
| Configure any package | Edit `config.el` — no `doom sync` needed, `M-x doom/reload` suffices |
| Pin a package to a safe commit | `:pin "abc1234"` in the `package!` declaration |
| Remove a package | Comment out its `package!` line and re-sync |

## File map

| File | Role |
|---|---|
| `init.el` | Doom module toggles — edit here to enable/disable bundled features |
| `packages.el` | Extra package declarations (straight.el recipes) |
| `config.el` | All personal settings, keybindings, and `use-package!` blocks |
| `custom.el` | Auto-managed by Emacs `customize` UI — don't hand-edit |
| `lisp/kickasm-mode.el` | Local Emacs mode for Kick Assembler (Commodore 64 cross-assembler) |
| `themes/spaceworm92-theme.el` | Custom dark theme (two capitalisation variants present) |
| `MyEmacs.md` | Personal keybinding cheatsheet, loadable via `Ctrl-x M-c` |

## Active non-standard packages

- **copilot / copilot-chat** — GitHub Copilot integration. `C-c C-o` toggles copilot mode, `Tab` accepts completions.
- **colorful-mode** — shows inline colour swatches for hex/named colours in code.
- **nyan-mode** — nyan cat in the modeline (animated, 48-bar width).
- **glsl-mode** — syntax for `.glsl`, `.frag`, `.vert`, `.fs`, `.vs` files.
- **kickasm-mode** — loaded from `lisp/`, not from MELPA. Requires Java + KickAss.jar at `/home/discovery/Apps/KickAssembler/KickAss.jar`.

## C64 assembly workflow

`C-c C-a` assembles the current buffer to a `.prg` via KickAssembler. The kickasm-mode also provides `C-c C-c` (assemble), `C-c C-v` (launch VICE emulator), `C-c C-d` (launch C64 Debugger), and `C-c C-f` / `C-c C-b` (jump to / return from definition).

## Known issues in config.el

**Line 146–147 garbled syntax** — `colorful-mode` config was accidentally embedded inside a `setq-default` call:
```elisp
;; BROKEN (current state):
(setq-default tab-w(use-package! colorful-mode
  :hook (prog-mode . colorful-mode))idth 4)

;; Should be two separate statements:
(setq-default tab-width 4)
(use-package! colorful-mode
  :hook (prog-mode . colorful-mode))
```
The correct `colorful-mode` config already exists again on line 183, so the garbled block is redundant.

**`doom-theme` set twice** — `doom-one` on line 35, then `softwave` on line 137. Only `softwave` is active; line 35 is dead.

**Theme load path** — `custom-theme-load-path` points to `~/.doom.d/themes/` but the themes live in `~/.config/doom/themes/`. This is only harmless if `~/.doom.d` symlinks to `~/.config/doom`.

## Doom module flags in use

Notable active flags (from `init.el`):
- `(corfu +orderless)` — completion with orderless fuzzy matching
- `(undo +tree)` — visual undo tree
- `(whitespace +guess +trim)` — auto-detects and trims whitespace
- `(vc-gutter +pretty)` — prettier diff indicators in the fringe
- `(eval +overlay)` — eval results shown inline as overlays
- `(cc +lsp)` — C/C++ with LSP (clangd)
- `tree-sitter` — structural syntax parsing
