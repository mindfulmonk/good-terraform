output "config_path" {
  description = "Path to the generated application config file"
  value       = local_file.app_config.filename
}

output "secrets_path" {
  description = "Path to the generated secrets file"
  value       = local_sensitive_file.secrets.filename
  sensitive   = true
}

output "secret_key" {
  description = "Generated application secret key"
  value       = random_password.secret_key.result
  sensitive   = true
}
