terraform {
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
}

resource "random_password" "secret_key" {
  length  = 32
  special = false
}

resource "local_file" "app_config" {
  filename        = "${path.root}/dist/${var.environment}/config.json"
  file_permission = "0644"
  content = jsonencode({
    app_name    = var.app_name
    environment = var.environment
    port        = var.port
    log_level   = var.log_level
    debug       = var.environment == "dev"
  })
}

resource "local_sensitive_file" "secrets" {
  filename        = "${path.root}/dist/${var.environment}/secrets.json"
  file_permission = "0600"
  content = jsonencode({
    secret_key = random_password.secret_key.result
    db_url     = var.db_url
  })
}
