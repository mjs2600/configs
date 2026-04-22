#!/usr/bin/env python3
"""Generate aliases.fish and aliases.sh from aliases.toml."""
from __future__ import annotations

import sys
import tomllib
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "aliases.toml"
HEADER = (
    "# AUTO-GENERATED from aliases.toml by scripts/gen_aliases.py.\n"
    "# Edit aliases.toml and run `just gen-aliases` (or `just tend`).\n\n"
)


def render_fish(entries: list[dict]) -> str:
    out = [HEADER.replace("#", "#")]
    for e in entries:
        line = _fish_line(e)
        if e.get("needs"):
            out.append(f"command -q {e['needs']}; and {line}\n")
        else:
            out.append(f"{line}\n")
    return "".join(out)


def _fish_line(e: dict) -> str:
    cmd = "abbr -a" if e.get("abbr") else "alias"
    return f"{cmd} {e['name']} '{e['value']}'"


def render_sh(entries: list[dict]) -> str:
    out = [HEADER, "have() { command -v \"$1\" >/dev/null 2>&1; }\n\n"]
    for e in entries:
        line = f"alias {e['name']}='{e['value']}'"
        if e.get("needs"):
            out.append(f"have {e['needs']} && {line}\n")
        else:
            out.append(f"{line}\n")
    out.append("\nunset -f have\n")
    return "".join(out)


def main() -> int:
    with open(SRC, "rb") as f:
        data = tomllib.load(f)
    entries = data.get("alias", [])

    fish_path = ROOT / "aliases.fish"
    sh_path = ROOT / "aliases.sh"
    fish_path.write_text(render_fish(entries))
    sh_path.write_text(render_sh(entries))
    print(f"✓ wrote {fish_path.name} and {sh_path.name} ({len(entries)} aliases)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
