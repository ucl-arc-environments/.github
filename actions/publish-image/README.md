# publish-image

This action can be used in the following manner:

```yaml
jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: ucl-arc-environments/.github/actions/publish-image@vx
        with:
          context: ./path/to/docker/context
          name: my-github-org/my-image
          registry: ghcr.io
          password: ${{ secrets.GITHUB_TOKEN }}
```

where `x` is the `major` version of the action.
