variable "vms" {
  type = map(object({
    name                      = string
    machine_type              = string
    image                     = string
    size                      = number
    labels                    = map(string)
    type                      = string
    allow_stopping_for_update = bool
    tags                      = list(string)
  }))
}