#!/usr/bin/env python

import os
import sys
from pathlib import Path
import tomllib

CONFIG_DIR: Path = Path(__file__).resolve().parent


def link_required(source_file: Path, target_file: Path) -> bool:
    if target_file.exists():
        if os.path.realpath(target_file) == os.path.realpath(source_file):
            return False
        target_file.unlink()

    return True


def mac_setup():
    from sh import brew

    print(f"Updating Brew Bundle")
    print(brew.bundle(file=CONFIG_DIR / "Brewfile"))


def main():
    with open(CONFIG_DIR / "dirs.toml", "rb") as f:
        links = tomllib.load(f)

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
