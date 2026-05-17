terraform {
  required_version = "= 1.7.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "= 2.9.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "= 3.9.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }
}

module "app_config" {
  source      = "../../modules/app-config"
  app_name    = var.app_name
  environment = "dev"
  port        = 8080
  log_level   = "debug"
  db_url      = var.db_url
}
