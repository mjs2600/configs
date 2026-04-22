# configs

Personal dotfiles. The same setup, dropped onto any Mac or Linux box.

## Bootstrap

```sh
git clone --recurse-submodules https://github.com/mjs2600/configs ~/configs
cd ~/configs
./setup.py
```

This will:

1. Symlink everything in [`dirs.toml`](dirs.toml) into your `$HOME`.
2. Install OS packages — Homebrew on macOS via [`Brewfile`](Brewfile)
   (GUI apps, fonts, system integrations), or just `git curl fish tmux`
   on Linux to bootstrap mise.
3. Install all CLI tools and language toolchains via
   [`mise.toml`](mise.toml) — same versions on every machine.
4. Install tmux plugins (TPM), Neovim plugins (lazy.nvim), and fish
   plugins (fundle).
5. Run `just tend` to regenerate aliases.

Idempotent — re-run any time to reconcile.

## Day-to-day grooming

Once bootstrapped, [`just`](justfile) is the single surface for everything.

```sh
just            # list recipes
just tend       # update brew, mise, lazy.nvim, tpm, fundle
just edit       # fuzzy-pick a config file and open it
just doctor     # quick health check of installed tools
just links      # re-link symlinks only
```

## Layout

| Path | Purpose |
|---|---|
| `init.lua`, `lua/` | Neovim config (lazy.nvim) |
| `config.fish` | Fish shell |
| `.zshrc` | Zsh fallback |
| `.tmux.conf`, `.tmux-line.conf`, `tpm/` | tmux + TPM submodule |
| `kitty.conf`, `kitty-theme.conf` | Kitty terminal |
| `Brewfile` | macOS GUI apps, fonts, system integrations |
| `mise.toml` | Cross-platform CLI tools and language toolchains |
| `aliases.toml` | Source of truth for shell aliases |
| `dirs.toml` | Symlink map for setup.py |
| `.dir_colors`, `.doom.d/` | Misc |

## Requirements

- Python 3.11+ (for `tomllib` in stdlib — no pip dependencies)
- Git
