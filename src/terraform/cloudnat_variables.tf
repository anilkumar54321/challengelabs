variable "cloud_nats" {
  type = map(object({
    router_name = string
    nat_name = string
    nat_ip_allocate_option = string
    source_subnetwork_ip_ranges_to_nat = string
  }))
}