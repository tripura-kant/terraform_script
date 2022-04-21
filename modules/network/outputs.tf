output "mod-networkid" {
value = google_compute_network.vpc_network.id
}

output "mod-networkname" {
value = google_compute_network.vpc_network.name
}

output "mod-subnets" {
  value       = google_compute_subnetwork.subnetwork
  description = "The created subnet resources"
}