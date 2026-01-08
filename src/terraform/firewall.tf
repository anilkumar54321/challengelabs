module "firewalls" {
  source        = "../modules/firewalls"
  for_each      = local.firewall_rules
  name          = each.value.name
  direction     = each.value.direction
  source_ranges = each.value.source_ranges
  target_tags   = each.value.target_tags
  allow         = each.value.allow
  network       = module.vpc["vpc1"].network_name
  depends_on    = [module.vpc]
}