resource "google_compute_instance" "vminstance" {
  for_each     = var.vms
  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = var.main.zone
  deletion_protection = false
  boot_disk {
    initialize_params {
      image  = each.value.image
      size   = each.value.size
      type   = each.value.type
      labels = each.value.labels
    }
  }
  network_interface {
    network = google_compute_network.network["vpc1"].name
  }
  allow_stopping_for_update = each.value.allow_stopping_for_update
  depends_on = [
    google_compute_network.network,
    google_compute_subnetwork.subnetwork
  ]
}
