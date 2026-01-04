terraform {
  backend "gcs" {
    bucket = "ck7674-terraform"
    prefix = "terraform/state"
  }
}
