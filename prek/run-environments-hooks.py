#!/usr/bin/env python3
import os
import pathlib
import subprocess
import sys

HERE = pathlib.Path(__file__).resolve()


def main() -> int:
    cfg = HERE.parent / "environments-hooks.yaml"
    env = os.environ.copy()
    env["ENVIRONMENTS_HOOKS_DIR"] = str(HERE.parent)
    result = subprocess.run(
        [
            "prek",
            "run",
            "--config",
            f"{cfg}",
            "--files",
        ]
        + sys.argv[1:],
        check=False,
        env=env,
    )
    return result.returncode


if __name__ == "__main__":
    exit(main())
