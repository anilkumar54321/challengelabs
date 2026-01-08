/*
module "vpc" {
  source                  = "../modules/vpc"
  for_each                = var.networks
  network_name            = each.value.network_name
  auto_create_subnetworks = each.value.auto_create_subnetworks
  routing_mode            = each.value.routing_mode
  description             = each.value.description
  project                 = var.main.project
}
*/


module "vpc" {
  source                  = "../modules/vpc"
  for_each                = local.networks
  network_name            = each.value.network_name
  auto_create_subnetworks = each.value.auto_create_subnetworks
  routing_mode            = each.value.routing_mode
  description             = each.value.description
  project                 = var.main.project
}




