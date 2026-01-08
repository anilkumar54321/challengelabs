locals {
  vms = {
    vm1 = {
      name         = "lumen-private-vm"
      machine_type = "e2-medium"
      image        = "debian-cloud/debian-11"
      size         = 50
      tags = [
        "allow-ssh", "web-server"
      ]
      labels = {
        "env" = "nprod"
      }
      type                      = "pd-standard"
      allow_stopping_for_update = true
      metadata_startup_script   = file("${"../modules/startup_script/script.sh"}")
    }
  }
}