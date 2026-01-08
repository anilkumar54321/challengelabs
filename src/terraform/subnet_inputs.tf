locals {
  subnetworks = {
    subnet_1 = {
      subnet_name              = "lumen-private-subnet"
      subnet_ip                = "10.0.1.0/24"
      private_ip_google_access = true
    }
  }
}