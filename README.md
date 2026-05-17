# good-terraform

![CI](https://github.com/mindfulmonk/good-terraform/actions/workflows/terraform-ci.yml/badge.svg)

Production-grade GCP infrastructure managed with Terraform, following GitOps best practices.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.7
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- [pre-commit](https://pre-commit.com/) >= 3.0
- GCP project with billing enabled

## Getting started

```bash
# 1. Install pre-commit hooks
pip install pre-commit && pre-commit install

# 2. Authenticate with GCP (Workload Identity — no key files)
gcloud auth application-default login

# 3. Copy and populate the vars example for your target environment
cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars

# 4. Initialise and plan
cd environments/dev
terraform init
terraform plan
```

## Repository structure

```
modules/          Reusable Terraform modules (vpc, compute, iam)
environments/     Per-environment root configurations (dev, prod)
.github/          CI workflows, issue templates, PR template
.claude/          Claude Code project settings
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). All changes go through a PR — no direct pushes to `main`.

## Authentication

This repo uses [Workload Identity Federation](https://cloud.google.com/iam/docs/workload-identity-federation) for CI. No service account key files are stored anywhere. Local development uses `gcloud auth application-default login`.
