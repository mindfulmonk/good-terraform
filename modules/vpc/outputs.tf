output "network_id" {
  description = "The self-link of the VPC network"
  value       = google_compute_network.vpc.id
}

output "subnet_id" {
  description = "The self-link of the primary subnet"
  value       = google_compute_subnetwork.subnet.id
}

output "subnet_cidr" {
  description = "The CIDR range of the primary subnet"
  value       = google_compute_subnetwork.subnet.ip_cidr_range
}
