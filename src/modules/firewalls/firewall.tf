resource "google_compute_firewall" "firewall_rules" {
  name          = var.name
  provider      = google-beta
  direction     = var.direction
  network       = var.network
  source_ranges = var.source_ranges
  target_tags   = var.target_tags
  dynamic "allow" {
    for_each = var.allow
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }
}
