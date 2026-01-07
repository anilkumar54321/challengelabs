module "load_balancer" {
  source = "../modules/load_balancer/instance_group"
  for_each = var.load_balancers
  name = each.value.name
  description = each.value.description
  zone = var.main.zone
  instances = ["projects/${var.main.project}/zones/${var.main.zone}/instances/lumen-private-vm"]
  port_name = each.value.port_name
  port_number = each.value.port_number
  hc_name = each.value.hc_name
  hc_tcp_port = each.value.hc_tcp_port
  backend_name = each.value.backend_name
  backend_port_name = each.value.backend_port_name
  backend_protocol = each.value.backend_protocol
  url_map = each.value.url_map
  target_http_proxy_name = each.value.target_http_proxy_name
  global_address = each.value.global_address
  rule_name = each.value.rule_name
  ip_protocol = each.value.ip_protocol
  load_balancing_scheme = each.value.load_balancing_scheme
  port_range = each.value.port_range
  depends_on = [module.vpc.networks, module.subnets.subnetworks, module.cloud_nat.cloud_nats,module.vm]
}

output "lb_ip" {
value = module.load_balancer
}


