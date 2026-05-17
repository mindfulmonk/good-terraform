variable "project_id" {
  description = "GCP project ID for the prod environment"
  type        = string
}

variable "region" {
  description = "GCP region to deploy into"
  type        = string
  default     = "us-central1"
}

variable "subnet_cidr" {
  description = "CIDR range for the prod VPC subnet — use a range that does not overlap with dev"
  type        = string
  default     = "10.1.0.0/24"
}
