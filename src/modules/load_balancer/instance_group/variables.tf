variable "name" {
  type = string
}
variable "description" {
  type = string
}
variable "zone" {
  type = string
}
variable "instances" {
  type = list(string)
}
variable "port_name" {
  type = string
}
variable "port_number" {
  type = string
}   

variable "hc_name" {
  type = string
}
variable "hc_tcp_port" {
  type = string
}
variable "backend_name" {
  type = string
}
variable "backend_port_name" {
  type = string
}
variable "backend_protocol" {
  type = string
}

variable "url_map" {
  type = string
}
variable "target_http_proxy_name" {
  type = string
}
variable "global_address" {
  type = string
}
variable "rule_name" {
  type = string
}
variable "ip_protocol" {
  type = string
}
variable "load_balancing_scheme" {
  type = string
}
variable "port_range" {
  type = string
}
