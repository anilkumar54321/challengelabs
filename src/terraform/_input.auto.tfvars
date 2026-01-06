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
    subnet_name              = "lumen-private-subnet"
    subnet_ip                = "10.0.1.0/24"
    private_ip_google_access = true
  }
}

#################### Firewall Rules Inputs #######################
firewall_rules = {
  fw_ssh = {
    name      = "fw-ssh-lb-http"
    direction = "INGRESS"
    source_ranges = [
      "130.211.0.0/22",
      "35.191.0.0/16" ,
      "35.235.240.0/20"
    ]
    target_tags = [
      "allow-ssh", "web-server"
    ]
    allow = [
      {
        protocol = "tcp"
        ports = [
          "22","80"
        ]
      }
    ]
  }
}


#################### VM Inputs #######################
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
  }
}

#################### CLOUD NAT Inputs #######################
cloud_nats = {
  nat1 = {
    router_name = "nat-router"
    nat_name = "cloud-nat"
    nat_ip_allocate_option = "AUTO_ONLY"
    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  }
}

#################### Load Balancer Inputs #######################
load_balancers = {
  lb1 = {
    name = "lumen-lb"
    description = "Load balancer for lumen pvt"
    port_name = "http"
    port_number = "80"
    hc_name = "http-hc"
    hc_tcp_port = "80"
    backend_name = "web-bs"
    backend_port_name = "http"
    backend_protocol = "HTTP"
    url_map = "web-url-map"
    target_http_proxy_name = "web-tp"
    global_address = "lb-ip"
    rule_name = "ssl-proxy-lb-forwarding-rule"
    ip_protocol = "TCP"
    load_balancing_scheme = "EXTERNAL"
    port_range = "80"
  }
}

