module "cloud_nat" {
    source = "../modules/cloud_nat"
    for_each = var.cloud_nats
    router_name = each.value.router_name //"nat-router"
    network_name = module.vpc["vpc1"].network_name //"vpc-lumen-network"
    region = var.main.region //"europe-west1"
    nat_name = each.value.nat_name //"cloud-nat"
    nat_ip_allocate_option = each.value.nat_ip_allocate_option //"AUTO_ONLY"
    source_subnetwork_ip_ranges_to_nat = each.value.source_subnetwork_ip_ranges_to_nat //"LIST_OF_SUBNETWORKS"
    subnetwork_name = module.subnets["subnet_1"].subnet //lumen-private-subnet"
}