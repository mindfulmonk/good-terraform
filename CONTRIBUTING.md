# Contributing

## Workflow

1. Pick up or create an issue — use the bug or feature template
2. Branch from `main` using the `feat/`, `fix/`, or `chore/` prefix
3. Make focused, single-purpose commits using [Conventional Commits](https://www.conventionalcommits.org/)
4. Run `pre-commit run --all-files` before pushing
5. Open a PR using the template — fill in every section
6. Request review; address all comments before merge
7. Delete your branch after merge

## Branch naming

```
feat/add-cloud-sql-module
fix/restrict-firewall-ingress
chore/update-provider-versions
```

## Commit messages

```
feat: add Cloud SQL module with private IP
fix: restrict firewall ingress to VPC CIDR
chore: bump google provider to 5.1
```

## Local setup

```bash
pip install pre-commit && pre-commit install
gcloud auth application-default login
cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars
# Edit terraform.tfvars with your dev project ID
```

## What the CI checks

| Check | Blocks merge? |
|---|---|
| `terraform fmt` | Yes |
| `terraform validate` (dev + prod) | Yes |
| `tfsec` | Yes |
| `terraform plan` | No (requires WIF secrets) |

## Never do these

- Push directly to `main`
- Commit `*.tfvars`, `credentials.json`, or `.terraform/`
- Use `terraform apply` without a reviewed plan
- Grant `roles/owner` to service accounts
