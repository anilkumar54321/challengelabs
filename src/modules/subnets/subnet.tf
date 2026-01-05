resource "google_compute_subnetwork" "subnetwork" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_ip
  region                   = var.region
  private_ip_google_access = var.private_ip_google_access
  network                  = var.network
}