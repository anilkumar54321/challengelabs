########## COMMON INPUTS ############
main = {
  project = "ck7674"
  region  = "europe-west1"
  zone    = "europe-west1-c"
}
service_accounts = {
  sa1 = {
    account_id   = "test-sa-from-terraform-1"
    display_name = "sa-from-tf-1"
  }
  sa2 = {
    account_id   = "test-sa-from-terraform-2"
    display_name = "sa-from-tf-2"
  }
}
