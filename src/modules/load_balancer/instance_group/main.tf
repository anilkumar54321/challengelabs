resource "google_compute_instance_group" "webservers" {
  name        = var.name
  description = var.description
  zone = var.zone
  instances = var.instances
  named_port {
    name = var.port_name
    port = var.port_number
  }
}

resource "google_compute_health_check" "hc" {
    name = var.hc_name //"http-hc"
    tcp_health_check {
        port = var.hc_tcp_port //80
    }
}


resource "google_compute_backend_service" "staging_service" {
  name      = var.backend_name //"web-bs"
  port_name = var.backend_port_name //"http"
  protocol  = var.backend_protocol //"HTTP"
  health_checks = [
    google_compute_health_check.hc.id]
  backend {
    group = google_compute_instance_group.webservers.self_link
  }
}


resource "google_compute_url_map" "urlmap" {
  name        = var.url_map //"web-url-map"
  default_service = google_compute_backend_service.staging_service.id
}

resource "google_compute_target_http_proxy" "tp" {
  name    = var.target_http_proxy_name //"web-tp"
  url_map = google_compute_url_map.urlmap.id
}


resource "google_compute_global_address" "lb_ip" {
    name = var.global_address //"lb-ip"
}

# forwarding rule
resource "google_compute_global_forwarding_rule" "fr" {
  name                  = var.rule_name //"ssl-proxy-lb-forwarding-rule"
  provider              = google
  ip_protocol           = var.ip_protocol //"TCP"
  load_balancing_scheme = var.load_balancing_scheme //"EXTERNAL"
  port_range            = var.port_range //"80"
  target                = google_compute_target_http_proxy.tp.id
  ip_address            = google_compute_global_address.lb_ip.id

  depends_on = [google_compute_target_http_proxy.tp, google_compute_global_address.lb_ip]
}


