## VM Variables ##
variable "name" {
  type = string
}
variable "machine_type" {
  type = string
}
variable "image" {
  type = string
}
variable "size" {
  type = number
}
variable "labels" {
  type = map(string)
}
variable "type" {
  type = string
}
variable "allow_stopping_for_update" {
  type = bool
}
variable "network" {
  type = string
}
variable "subnetwork" {
  type = string
}
variable "tags" {
  type = list(string)
}
variable "zone" {
  type = string
}

variable "metadata_startup_script" {
  type = string
}
