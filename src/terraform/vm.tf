module "vm" {
  source                    = "../modules/vm"
  for_each                  = local.vms
  name                      = each.value.name
  zone                      = var.main.zone
  machine_type              = each.value.machine_type
  image                     = each.value.image
  size                      = each.value.size
  labels                    = each.value.labels
  tags                      = each.value.tags
  type                      = each.value.type
  allow_stopping_for_update = each.value.allow_stopping_for_update
  network                   = module.vpc["vpc1"].network_name
  subnetwork                = module.subnets["subnet_1"].subnet
  metadata_startup_script   = each.value.metadata_startup_script
  depends_on                = [module.vpc.networks, module.subnets.subnetworks, module.cloud_nat.cloud_nats]
}