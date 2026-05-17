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
feat/add-app-config-module
fix/relax-port-validation
chore/bump-provider-versions
```

## Commit messages

```
feat: add app-config module with local and random providers
fix: relax port validation to allow privileged ports
chore: bump random provider to 3.9.0
```

## Local setup

```bash
pip install pre-commit && pre-commit install
cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars
# Edit terraform.tfvars with your values
cd environments/dev && terraform init && terraform plan
```

## What the CI checks

| Check | Blocks merge? |
|---|---|
| `terraform fmt` | Yes |
| `terraform validate` (dev + prod) | Yes |
| `checkov` | Yes |
| `terraform plan` (dev + prod) | No — posts output as PR comment if `DB_URL` secret is set |

## Never do these

- Push directly to `main`
- Commit `*.tfvars` or `.terraform/`
- Use `terraform apply` without a reviewed plan
