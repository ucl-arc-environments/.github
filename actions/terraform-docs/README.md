# linting

To use this action to find and update a README file for a specific Terraform
module in a repository, it can be used in the following manner:

```yaml
jobs:
  linting:
    runs-on: ubuntu-latest
    steps:
      - uses: ucl-arc-environments/.github/actions/terraform-docs@vx
        with:
          working-dir: ./path/to/terraform/module
```

To use this action to find and update README files for all Terraform modules in
a repository, it can be used in the following manner:

```yaml
jobs:
  linting:
    runs-on: ubuntu-latest
    steps:
      - uses: ucl-arc-environments/.github/actions/terraform-docs@vx
        with:
          find-dir: ./path/to/terraform/modules
```

Don't use both `working-dir` and `find-dir` inputs at the same time.

To use this action to find and update README files for all Terraform modules in
a repository where there are other workflows which are required for status
checks, it can be used in the following manner:

```yaml
jobs:
  linting:
    runs-on: ubuntu-latest
    steps:
      - uses: ucl-arc-environments/.github/actions/terraform-docs@vx
        with:
          find-dir: ./path/to/terraform/modules
          github-app-id: ${{ secrets.GITHUB_APP_ID }}
          github-app-private-key: ${{ secrets.GITHUB_APP_PRIVATE_KEY }}
```

In the above 'x' is the `major` version of the action.
