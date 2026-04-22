# Grooming commands for this dotfiles bonsai.
# (Bootstrap a fresh machine with `./setup.py` — `just` itself isn't
# guaranteed to exist before then.)
#
#   just              # list recipes
#   just tend         # update everything in place
#   just edit         # fuzzy-pick a config file in $EDITOR
#   just doctor       # show versions of key tools
#   just links        # refresh symlinks

set shell := ["bash", "-c"]

# List available recipes
default:
    @just --list --unsorted

# Refresh symlinks
links:
    ./setup.py --links

# Update every managed surface in one go
tend: links gen-aliases brew-update mise-update nvim-update tmux-update fish-update
    @echo "🌿 Tended."

# Regenerate aliases.fish and aliases.sh from aliases.toml
gen-aliases:
    @./scripts/gen_aliases.py

brew-update:
    @command -v brew >/dev/null && brew bundle --file=Brewfile && brew upgrade || true

mise-update:
    @command -v mise >/dev/null && mise upgrade || true

nvim-update:
    @command -v nvim >/dev/null && nvim --headless "+Lazy! sync" +qa || true

tmux-update:
    @if [ -x tpm/bin/update_plugins ] && command -v tmux >/dev/null; then \
        tmux start-server \; set-environment -g TMUX_PLUGIN_MANAGER_PATH "$HOME/.tmux/plugins/"; \
        tpm/bin/update_plugins all; \
    fi

fish-update:
    @command -v fish >/dev/null && fish -c "fundle update" || true

# Fuzzy-pick a config file and open it in $EDITOR
edit:
    #!/usr/bin/env bash
    file=$(git ls-files | fzf --preview 'bat --color=always --style=plain {}') \
        && ${EDITOR:-nvim} "$file"

# Quick health check
doctor:
    @echo "── tools ──"
    @for t in brew mise uv starship nvim tmux fish git; do \
        printf "  %-10s " $$t; \
        command -v $$t >/dev/null && $$t --version 2>&1 | head -n1 || echo "(missing)"; \
    done
    @echo "── symlinks ──"
    @./setup.py --links
