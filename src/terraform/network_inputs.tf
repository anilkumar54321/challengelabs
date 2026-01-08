locals {
  networks = {
    vpc1 = {
      network_name            = "vpc-lumen-network1"
      routing_mode            = "REGIONAL"
      description             = "VPC for lumen"
      auto_create_subnetworks = false
    }
  }
}