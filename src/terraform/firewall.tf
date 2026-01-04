resource "google_compute_firewall" "firewall_rules" {
  for_each      = var.firewall_rules
  name          = each.value.name
  provider      = google-beta
  direction     = each.value.direction
  network       = "projects/${var.main.project}/global/networks/${google_compute_network.network["vpc1"].name}"
  source_ranges = each.value.source_ranges
  target_tags   = each.value.target_tags
  dynamic "allow" {
    for_each = each.value.allow
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }
  depends_on = [
    google_compute_network.network
  ]
}
