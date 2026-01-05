module "subnets" {
  source                   = "../modules/subnets"
  for_each                 = var.subnetworks
  subnet_name              = each.value.subnet_name
  subnet_ip                = each.value.subnet_ip
  private_ip_google_access = each.value.private_ip_google_access
  network                  = module.vpc["vpc1"].network_name
  region                   = var.main.region
  depends_on = [
  module.vpc.networks]
}
