# linting

This action can be used in the following manner:

```yaml
jobs:
  linting:
    runs-on: ubuntu-latest
    steps:
      - uses: ucl-arc-environments/.github/actions/linting@vx
        with:
          pre-commit-config: ./.pre-commit-config.yaml
```

where `x` is the `major` version of the action. If linting Terraform code that
uses module sources from the Terraform Registry that require authentication, you
can provide a Terraform token as follows (in this example, the token is stored
in a GitHub secret named `TF_API_TOKEN`):

```yaml
jobs:
  linting:
    runs-on: ubuntu-latest
    steps:
      - uses: ucl-arc-environments/.github/actions/linting@vx
        with:
          pre-commit-config: ./.pre-commit-config.yaml
          terraform-token: ${{ secrets.TF_API_TOKEN }}
```
