resource "google_compute_router" "router" {
  name    = var.router_name
  network = var.network_name
  region  = var.region
}

resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name 
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  subnetwork {
    name = var.subnetwork_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
  depends_on = [google_compute_router.router]
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}