resource "google_compute_instance" "vminstance" {
  name                = var.name
  machine_type        = var.machine_type
  zone                = var.zone
  deletion_protection = false
  tags                = var.tags
  boot_disk {
    initialize_params {
      image  = var.image
      size   = var.size
      type   = var.type
      labels = var.labels
    }
  }
  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  }
  allow_stopping_for_update = var.allow_stopping_for_update
  metadata_startup_script = <<-EOF
  #!/bin/bash
  apt-get update -qq
  apt-get install -y nginx
  systemct1 restart nginx
  echo "<h1> Hello this is private vm server from Lumen </h1>" > /var/www/html/index.html
  EOF
}
