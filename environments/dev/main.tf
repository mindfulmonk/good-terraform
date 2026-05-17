terraform {
  required_version = "= 1.7.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "= 7.32.0"
    }
  }

  backend "gcs" {
    bucket = "my-company-terraform-state"
    prefix = "dev"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source      = "../../modules/vpc"
  project_id  = var.project_id
  region      = var.region
  environment = "dev"
  subnet_cidr = var.subnet_cidr
}
