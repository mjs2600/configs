#!/usr/bin/env python3
"""
Bootstrap this configs repo on a new machine.

  1. Symlink files listed in dirs.toml into their destinations.
  2. Install OS-level packages — Homebrew on macOS via Brewfile, or just
     enough on Linux (git, curl, fish, tmux) to bootstrap mise.
  3. Ensure mise is installed (via official install script if not present).
  4. Install all CLI tools and language toolchains via `mise install`.
  5. Install tmux plugins (TPM submodule) and Neovim plugins (lazy.nvim).
  6. Install fish plugins via fundle.
  7. Run `just tend` to regenerate aliases and upgrade everything.

Usage:
    ./setup.py           # do everything
    ./setup.py --links   # only refresh symlinks
"""
from __future__ import annotations

import argparse
import os
import shutil
import subprocess
import sys
import tomllib
from pathlib import Path

CONFIG_DIR = Path(__file__).resolve().parent

# Minimal Linux bootstrap: just enough to run fish/tmux and to fetch mise,
# which then installs everything else cross-platform via mise.toml.
LINUX_BOOTSTRAP_PACKAGES = ["git", "curl", "fish", "tmux", "build-essential"]


def run(cmd: list[str], **kwargs) -> int:
    print(f"$ {' '.join(cmd)}")
    return subprocess.run(cmd, **kwargs).returncode


def have(binary: str) -> bool:
    return shutil.which(binary) is not None


# --------------------------------------------------------------------------- #
# Symlinks
# --------------------------------------------------------------------------- #
def link_files() -> None:
    with open(CONFIG_DIR / "dirs.toml", "rb") as f:
        links = tomllib.load(f)

    for dest_dir, files in links.items():
        destination_dir = Path(dest_dir).expanduser()
        destination_dir.mkdir(parents=True, exist_ok=True)
        for entry in files:
            # Entry is either "filename" (kept as-is) or {src, dst} for renames.
            if isinstance(entry, dict):
                source = CONFIG_DIR / entry["src"]
                target = destination_dir / entry["dst"]
            else:
                source = CONFIG_DIR / entry
                target = destination_dir / Path(entry).name

            if not source.exists():
                print(f"⚠️  Skipping missing source: {source}")
                continue
            if target.is_symlink() or target.exists():
                if target.resolve() == source.resolve():
                    print(f"🔗 Already linked:  {target}")
                    continue
                target.unlink()
            target.symlink_to(source)
            print(f"🖇️  Linked:          {target} -> {source}")


# --------------------------------------------------------------------------- #
# OS packages
# --------------------------------------------------------------------------- #
def install_packages() -> None:
    if sys.platform == "darwin":
        if not have("brew"):
            print("⚠️  Homebrew not installed; skipping Brewfile.")
            print("    Install from https://brew.sh and re-run.")
            return
        run(["brew", "bundle", f"--file={CONFIG_DIR / 'Brewfile'}"])
        return

    if sys.platform.startswith("linux"):
        installer = _detect_linux_installer()
        if installer is None:
            print("⚠️  No supported Linux package manager found.")
            return
        run(installer + LINUX_BOOTSTRAP_PACKAGES)
        return

    print(f"⚠️  Unsupported platform: {sys.platform}")


def _detect_linux_installer() -> list[str] | None:
    if have("apt-get"):
        return ["sudo", "apt-get", "install", "-y"]
    if have("dnf"):
        return ["sudo", "dnf", "install", "-y"]
    if have("pacman"):
        return ["sudo", "pacman", "-S", "--needed", "--noconfirm"]
    return None


# --------------------------------------------------------------------------- #
# mise (language versions)
# --------------------------------------------------------------------------- #
def ensure_mise() -> None:
    if have("mise"):
        return
    print("ℹ️  Installing mise via https://mise.run")
    # `curl <url> | sh` via shell, since piping requires a shell.
    run(["sh", "-c", "curl -fsSL https://mise.run | sh"])


def install_mise_tools() -> None:
    mise = shutil.which("mise") or os.path.expanduser("~/.local/bin/mise")
    if not Path(mise).exists():
        print("⚠️  mise not installed; skipping `mise install`.")
        return
    if not (CONFIG_DIR / "mise.toml").exists():
        return
    run([mise, "install"], cwd=CONFIG_DIR)


# --------------------------------------------------------------------------- #
# Editor / shell plugins
# --------------------------------------------------------------------------- #
def install_tmux_plugins() -> None:
    tpm = CONFIG_DIR / "tpm"
    if not (tpm / "tpm").exists():
        run(["git", "submodule", "update", "--init", "--recursive"],
            cwd=CONFIG_DIR)
    install_script = tpm / "bin" / "install_plugins"
    if install_script.exists() and have("tmux"):
        plugin_path = str(Path.home() / ".tmux" / "plugins") + "/"
        # TPM reads TMUX_PLUGIN_MANAGER_PATH from tmux's global env, not the
        # shell, so seed it on the running server before invoking the script.
        run(["tmux", "start-server", ";",
             "set-environment", "-g", "TMUX_PLUGIN_MANAGER_PATH", plugin_path])
        run([str(install_script)])


def install_nvim_plugins() -> None:
    if not have("nvim"):
        print("⚠️  nvim not installed; skipping plugin sync.")
        return
    run(["nvim", "--headless", "+Lazy! sync", "+qa"])


def install_fish_plugins() -> None:
    if not have("fish"):
        return
    run(["fish", "-c", "fundle install"])


def tend() -> None:
    """Run `just tend` if just is available; the bootstrap steps above are
    enough on their own, but `tend` also generates aliases and upgrades
    everything to current versions."""
    if have("just"):
        run(["just", "tend"], cwd=CONFIG_DIR)
    else:
        # Fallback: at least regenerate aliases so the shell files exist.
        gen = CONFIG_DIR / "scripts" / "gen_aliases.py"
        if gen.exists():
            run([str(gen)])


# --------------------------------------------------------------------------- #
# Entry point
# --------------------------------------------------------------------------- #
def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--links", action="store_true",
                        help="Only refresh symlinks; skip everything else.")
    args = parser.parse_args()

    link_files()
    if args.links:
        return

    install_packages()
    ensure_mise()
    install_mise_tools()
    install_tmux_plugins()
    install_fish_plugins()
    install_nvim_plugins()
    tend()


if __name__ == "__main__":
    main()
