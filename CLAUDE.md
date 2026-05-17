# good-terraform

Example Terraform repo demonstrating GitOps best practices. Uses only local providers — no cloud credentials needed.

## Project structure

- `modules/app-config/` — generates environment-specific config and secrets files using `local` and `random` providers
- `environments/dev/` and `environments/prod/` — root configs that call the module with environment-specific values
- `.github/workflows/` — CI pipelines (fmt, validate, checkov, plan)
- `dist/` — generated output from `terraform apply`, gitignored

## Development workflow

1. Branch from `main` using `feat/`, `fix/`, or `chore/` prefix
2. Run `pre-commit run --all-files` before pushing
3. Open a PR — CI runs automatically and posts the plan as a comment
4. PRs require 1 approval + passing CI before merge
5. Delete your branch after merge

## Allowed commands

- `terraform fmt -recursive` — format all .tf files
- `terraform validate` — validate syntax (run from an environment directory)
- `terraform plan` — review changes before applying
- `terraform apply` — apply after a reviewed plan
- `pre-commit run --all-files` — run all hooks locally

## Never do these

- Never commit `*.tfvars` (only `*.tfvars.example`)
- Never commit `.terraform/` directories or `dist/`
- Never push directly to `main`
- Never `terraform apply` without a reviewed plan

## Commit convention

Use [Conventional Commits](https://www.conventionalcommits.org/):
- `feat:` new resource or module
- `fix:` bug fix
- `chore:` tooling, deps, config with no functional change
- `docs:` documentation only

## CI

GitHub Actions runs on every PR touching `.tf` files:
- `terraform fmt -check -recursive`
- `terraform validate` (dev and prod in parallel)
- `checkov` security scan
- `terraform plan` (dev and prod) — output posted as PR comment, no credentials required
