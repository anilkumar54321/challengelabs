locals {
  cloud_nats = {
    nat1 = {
      router_name                        = "nat-router"
      nat_name                           = "cloud-nat"
      nat_ip_allocate_option             = "AUTO_ONLY"
      source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
    }
  }
}