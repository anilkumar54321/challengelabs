locals {
  load_balancers = {
    lb1 = {
      name                   = "lumen-lb"
      description            = "Load balancer for lumen pvt"
      port_name              = "http"
      port_number            = "80"
      hc_name                = "http-hc"
      hc_tcp_port            = "80"
      backend_name           = "web-bs"
      backend_port_name      = "http"
      backend_protocol       = "HTTP"
      url_map                = "web-url-map"
      target_http_proxy_name = "web-tp"
      global_address         = "lb-ip"
      rule_name              = "ssl-proxy-lb-forwarding-rule"
      ip_protocol            = "TCP"
      load_balancing_scheme  = "EXTERNAL"
      port_range             = "80"
    }
  }
}