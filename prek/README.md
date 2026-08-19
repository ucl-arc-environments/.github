# Default prek config

In a repository that requires [prek](https://github.com/j178/prek), simply add a
file called `.pre-commit-config.yaml` with the following code.

```yaml
repos:
  - repo: https://github.com/ucl-arc-environments/.github
    rev: v0.1.0
    hooks:
      - id: environments-hooks
```

Then run `prek install; prek autoupdate`.

## Spellchecking

If a repository is experiencing spellchecking problems caused by
[typos](https://github.com/crate-ci/typos) then one can create a `.typos.toml`
file and fill it with the following:

```toml
[default]
extend-ignore-re = [
    # Custom ignore regex patterns:
    # https://github.com/crate-ci/typos/blob/master/docs/reference.md#example-configurations
    ".*(?:#|--|//|/*).*(?:typos):\\s?ignore[^\\n]*\\n",
    ".*(?:typos):\\s?ignore-next-line[^\\n]*\\n[^\\n]*",
]
```

One can then add, for example, `# typos: ignore` on a given line, or `# typos:
ignore-next-line` on a preceeding line. Note that this should work with any
style of comment.

## Acknowledgements

Follows, and is very much indebited to, the approach taken by [Paddy
Roddy](https://github.com/paddyroddy) in the [UCL-MIRSG Github
org](https://github.com/UCL-MIRSG/.github/blob/main/prek/README.md).
