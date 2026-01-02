resource "google_compute_subnetwork" "subnetwork" {
  for_each                 = var.subnetworks
  name                     = each.value.subnet_name
  ip_cidr_range            = each.value.subnet_ip
  region                   = each.value.subnet_region
  private_ip_google_access = each.value.private_ip_google_access
  network                  = google_compute_network.network["vpc1"].name
  depends_on = [
    google_compute_network.network
  ]
}
