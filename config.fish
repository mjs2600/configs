# ---------------------------------------------------------------------------
# SSH / GPG agent (only if keychain is installed and the key exists)
# ---------------------------------------------------------------------------
if command -q keychain
    set -l keychain_args
    test -f $HOME/.ssh/id_rsa; and set -a keychain_args $HOME/.ssh/id_rsa
    set -l gpg_key 0B28528DFC618532A82411F872382B4C2A2D9393
    if command -q gpg; and gpg --list-secret-keys $gpg_key &>/dev/null
        set -a keychain_args $gpg_key
    end
    if test (count $keychain_args) -gt 0
        keychain --agents "gpg,ssh" $keychain_args &>/dev/null
        for f in $HOME/.keychain/*-fish
            test -f $f; and source $f
        end
    end
end

# ---------------------------------------------------------------------------
# Fundle plugin manager
# ---------------------------------------------------------------------------
if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'danhper/fish-ssh-agent'
fundle plugin 'jethrokuan/fzf'
fundle plugin 'oh-my-fish/plugin-rustup'
fundle plugin 'oh-my-fish/plugin-python'
fundle plugin 'derekstavis/fish-neovim'
fundle plugin 'belltoy/plugin-mix'
fundle plugin 'belltoy/plugin-iex'
fundle plugin 'oh-my-fish/plugin-cd'
fundle plugin 'oh-my-fish/plugin-fasd'

# Linux-only plugins
switch (uname)
    case Linux
        if test -f /etc/arch-release
            fundle plugin 'oh-my-fish/plugin-archlinux'
        end
end

fundle init

# Auto-install plugins on first run of a new machine
if test -z "$__fundle_bootstrapped"; and not test -d $__fish_config_dir/fundle
    fundle install
    set -U __fundle_bootstrapped 1
end

# ---------------------------------------------------------------------------
# Tool integrations (guarded so missing tools don't spam errors)
# ---------------------------------------------------------------------------
command -q starship; and starship init fish | source
command -q mise; and mise activate fish | source

set -gx EDITOR nvim

# ---------------------------------------------------------------------------
# Auto-start tmux on interactive SSH / local shells
# ---------------------------------------------------------------------------
if status --is-interactive; and test -z "$TMUX"; and command -q tmux
    if test -n "$SSH_CONNECTION"
        exec tmux new -A -s (hostname)
    else
        exec tmux new -A -s local
    end
end

# ---------------------------------------------------------------------------
# PATH (use $HOME so it works on macOS and Linux)
# ---------------------------------------------------------------------------
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.cabal/bin
fish_add_path -g $HOME/.ghcup/bin

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------
if command -q docker
    alias m4b-tool='docker run -it --rm -u (id -u):(id -g) -v (pwd):/mnt m4b-tool'
end

# ghcup
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
