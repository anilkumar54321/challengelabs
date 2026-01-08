locals {
  firewall_rules = {
    fw_ssh = {
      name      = "fw-ssh-lb-http"
      direction = "INGRESS"
      source_ranges = [
        "130.211.0.0/22",
        "35.191.0.0/16",
        "35.235.240.0/20"
      ]
      target_tags = [
        "allow-ssh", "web-server"
      ]
      allow = [
        {
          protocol = "tcp"
          ports = [
            "22", "80"
          ]
        }
      ]
    }
  }
}