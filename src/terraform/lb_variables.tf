variable "load_balancers" {
  type = map(object({
    name = string
    description = string
    port_name = string
    port_number = string
    hc_name = string
    hc_tcp_port = string
    backend_name = string
    backend_port_name = string
    backend_protocol = string
    url_map = string
    target_http_proxy_name = string
    global_address = string
    rule_name = string
    ip_protocol = string
    load_balancing_scheme = string
    port_range = string
  }))   
}
