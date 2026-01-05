variable "subnetworks" {
  type = map(object({
    subnet_name              = string
    subnet_ip                = string
    private_ip_google_access = bool
  }))
}