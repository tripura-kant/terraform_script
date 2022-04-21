terraform {
  backend "gcs" {
    bucket      = "equi-statefile-tf"
    prefix      = "terraform/network/state"
  }
}
