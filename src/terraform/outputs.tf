output "network_name" {
  value = module.vpc["vpc1"]
}

output "subnet" {
  value = module.subnets["subnet_1"]
}

output "fw_name" {
  value = module.firewalls["fw_ssh"]
}

output "vm" {
  value = module.vm["vm1"]
}

output "lb_ip" {
  value = module.load_balancer
}
