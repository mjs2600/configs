#!/usr/bin/env python

import os
import sys
from pathlib import Path

from sh import brew, pip

CONFIG_DIR: Path = Path(__file__).resolve().parent

def link_required(source_file: Path, target_file: Path) -> bool:
    if target_file.exists():
        if target_file.readlink() == source_file:
            return False
        target_file.unlink()

    return True

def mac_setup():
    print(f"Updating brew bundle")
    print(brew.bundle(file=CONFIG_DIR / 'Brewfile'))

def main():
    pip.install("pyyaml")
    import yaml

    with open(CONFIG_DIR / "dirs.yaml") as f:
        links = yaml.full_load(f)

    for dir, files in links.items():
        destination_dir = Path(os.path.expanduser(dir))
        destination_dir.mkdir(parents=True, exist_ok=True)
        for file in files:
            target_file = destination_dir / os.path.basename(file)
            source_file = CONFIG_DIR / file
            if link_required(source_file, target_file):
                target_file.symlink_to(source_file)
                print(f"🖇️ Link Created:\t\t{target_file}")
            else:
                print(f"🔗 Already Linked:\t {target_file}")

    if sys.platform == "darwin":
        mac_setup()

if __name__ == "__main__":
    main()
