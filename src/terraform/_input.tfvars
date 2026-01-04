########## COMMON INPUTS ############
main = {
  project = "ck7674"
  region  = "europe-west1"
  zone    = "europe-west1-c"
}

#################### VPC Inputs #######################
networks = {
  vpc1 = {
    network_name            = "vpc-lumen-network"
    routing_mode            = "REGIONAL"
    description             = "VPC for lumen"
    auto_create_subnetworks = false
  }
}
#################### Subnets Inputs #######################
subnetworks = {
  subnet_1 = {
    subnet_name              = "lumen-subnet"
    subnet_ip                = "10.0.1.0/24"
    private_ip_google_access = true
  }
}

#################### Firewall Rules Inputs #######################
firewall_rules = {
  fw_ssh = {
    name      = "fw-ssh"
    direction = "INGRESS"
    source_ranges = [
      "0.0.0.0/0"
    ]
    target_tags = [
      "allow-ssh"
    ]
    allow = [
      {
        protocol = "tcp"
        ports = [
          "22"
        ]
      }
    ]
  }
}


#################### VM Inputs #######################
vms = {
  vm1 = {
    name         = "lumen-test-vm-1"
    machine_type = "e2-medium"
    image        = "debian-cloud/debian-11"
    size         = 50
    labels = {
      "env" = "nprod"
    }
    type                      = "pd-standard"
    allow_stopping_for_update = true
  }
}
