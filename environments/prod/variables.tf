variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "my-app"
}

variable "db_url" {
  description = "Database connection URL"
  type        = string
  sensitive   = true
}
