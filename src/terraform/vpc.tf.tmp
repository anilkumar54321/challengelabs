resource "google_compute_network" "network" {
  for_each                = var.networks
  name                    = each.value.network_name
  auto_create_subnetworks = each.value.auto_create_subnetworks
  routing_mode            = each.value.routing_mode
  project                 = var.main.project
  description             = each.value.description
}

output "network_name" {
  value = google_compute_network.network["vpc1"].name
}
