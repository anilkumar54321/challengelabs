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