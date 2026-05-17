# good-terraform

Production GCP infrastructure managed with Terraform. This file tells Claude Code how to work in this repo.

## Project structure

- `modules/` — reusable Terraform modules. Each module has `main.tf`, `variables.tf`, `outputs.tf`
- `environments/dev/` and `environments/prod/` — root configs that call modules
- `.github/workflows/` — CI pipelines (fmt, validate, tfsec, plan)
- Authentication uses Workload Identity Federation — no credential files exist or should ever be committed

## Development workflow

1. Branch from `main` using the convention `feat/`, `fix/`, or `chore/` prefix
2. Run `pre-commit run --all-files` before pushing
3. Open a PR — the CI pipeline runs automatically
4. PRs require 1 approval + passing CI before merge
5. Delete your branch after merge

## Allowed commands

- `terraform fmt -recursive` — format all .tf files
- `terraform validate` — validate syntax (run from an environment directory)
- `terraform plan` — always review before apply
- `pre-commit run --all-files` — run all hooks locally
- `gcloud auth application-default login` — authenticate locally (no key files)

## Never do these

- Never commit `credentials.json` or any `.json` key file
- Never commit `*.tfvars` (only `*.tfvars.example`)
- Never commit `.terraform/` directories
- Never `terraform apply` without a reviewed plan
- Never push directly to `main`

## Commit convention

Use [Conventional Commits](https://www.conventionalcommits.org/):
- `feat:` new resource or module
- `fix:` bug fix or security remediation
- `chore:` tooling, deps, config with no functional change
- `docs:` documentation only

## CI

GitHub Actions runs on every PR:
- `terraform fmt -check -recursive`
- `terraform validate`
- `tfsec` security scan (fails on HIGH/CRITICAL)
- `terraform plan` output posted as PR comment (uses Workload Identity — no stored keys)

## Getting help

See `README.md` for setup steps. Raise a GitHub issue using the bug or feature template.
