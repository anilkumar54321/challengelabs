## common inputs ##
variable "main" {
  type = object({
    project = string
    region  = string
    zone    = string
  })
}

## VPC Variable ##
variable "networks" {
  type = map(object({
    network_name            = string
    routing_mode            = string
    description             = string
    auto_create_subnetworks = bool
  }))
}
## Subnet Variables ##
variable "subnetworks" {
  type = map(object({
    subnet_name              = string
    subnet_ip                = string
    private_ip_google_access = bool
  }))
}

## Firewall Variables ##
variable "firewall_rules" {
  type = map(object({
    name          = string
    direction     = string
    source_ranges = list(string)
    target_tags   = list(string)
    allow = list(object({
      protocol = string
      ports    = list(string)
    }))
  }))
}

## VM Variables ##
variable "vms" {
  type = map(object({
    name                      = string
    machine_type              = string
    image                     = string
    size                      = number
    labels                    = map(string)
    type                      = string
    allow_stopping_for_update = bool
  }))
}
