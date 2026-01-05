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