## Firewall Variables ##
variable "name" {
  type = string
}
variable "direction" {
  type = string
}
variable "source_ranges" {
  type = list(string)
}
variable "target_tags" {
  type = list(string)
}
variable "allow" {
  type = list(object({
    protocol = string
    ports    = list(string)
  }))
}
variable "network" {
  type = string
}