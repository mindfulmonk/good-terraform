# good-terraform

![CI](https://github.com/mindfulmonk/good-terraform/actions/workflows/terraform-ci.yml/badge.svg)

Example Terraform repository demonstrating GitOps best practices. Uses only local providers — no cloud credentials required to run `terraform plan`.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) = 1.7.0
- [pre-commit](https://pre-commit.com/) >= 3.0

## Getting started

```bash
# 1. Install pre-commit hooks
pip install pre-commit && pre-commit install

# 2. Copy and populate the vars example for your target environment
cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars

# 3. Initialise and plan
cd environments/dev
terraform init
terraform plan
```

## Repository structure

```
modules/          Reusable Terraform modules
  app-config/     Generates environment-specific config and secret files
environments/     Per-environment root configurations (dev, prod)
.github/          CI workflows, issue templates, PR template
.claude/          Claude Code project settings
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). All changes go through a PR — no direct pushes to `main`.

## CI

On every PR touching `.tf` files, GitHub Actions runs:

| Check | Required |
|---|---|
| `terraform fmt` | Yes |
| `terraform validate` (dev + prod) | Yes |
| `checkov` | Yes |
| `terraform plan` (dev + prod) | No — posts output as PR comment |
