## common inputs ##
variable "main" {
  type = object({
    project = string
    region  = string
    zone    = string
  })
}

## service account ##
variable "service_accounts" {
  type = map(object({
    account_id   = string
    display_name = string
  }))
}
