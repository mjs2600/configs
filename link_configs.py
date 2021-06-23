#!/usr/bin/env python

import os
from pathlib import Path

import yaml


def link_required(source_file: Path, target_file: Path) -> bool:
    if target_file.exists():
        if target_file.readlink() == source_file:
            return False
        target_file.unlink()

    return True


def main():
    with open("dirs.yaml") as f:
        links = yaml.full_load(f)
    config_dir = Path.cwd()

    for dir, files in links.items():
        destination_dir = Path(os.path.expanduser(dir))
        destination_dir.mkdir(parents=True, exist_ok=True)
        for file in files:
            target_file = destination_dir / file
            source_file = config_dir / file
            if link_required(source_file, target_file):
                target_file.symlink_to(source_file)
                print(f"🖇️ Link Created:\t\t{target_file}")
            else:
                print(f"🔗 Already Linked:\t {target_file}")


if __name__ == "__main__":
    main()
