# terraform-lock-update

This action can be used in the following manner for a Terraform module lock
file:

```yaml
jobs:
  terraform-lock-update:
    permissions:
      contents: write
    runs-on: ubuntu-slim
    steps:
      - uses: ucl-arc-environments/.github/actions/terraform-lock-update@vx
        with:
          app-id: ${{ vars.TERRAFORM_LOCK_UPDATE_APP_ID }}
          app-pem: ${{ secrets.TERRAFORM_LOCK_UPDATE_APP_PRIVATE_KEY }}
```

To update the lock file for a Terraform StacK:

```yaml
jobs:
  terraform-lock-update:
    permissions:
      contents: write
    runs-on: ubuntu-slim
    steps:
      - uses: ucl-arc-environments/.github/actions/terraform-lock-update@vx
        with:
          app-id: ${{ vars.TERRAFORM_LOCK_UPDATE_APP_ID }}
          app-pem: ${{ secrets.TERRAFORM_LOCK_UPDATE_APP_PRIVATE_KEY }}
          terraform-stacks-dir: /path/to/stack
```

In these examples, `x` is the `major` version of the action.

