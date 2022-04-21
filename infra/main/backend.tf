terraform {
  backend "gcs" {
    bucket      = "equi-statefile-tf"
    prefix      = "terraform/infra/state"
  }
}
