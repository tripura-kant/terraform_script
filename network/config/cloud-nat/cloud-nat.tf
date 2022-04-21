module "eqgnat-o-gss-npr-us-01" {
  source = "git::https://source.developers.google.com/p/infgprj-gss-n-iacbst-gl-01/r/infgrep-gss-iac-mod-npr-01//modules/cloud-nat/"
  project_id                          = "infgprj-gss-n-iacbst-gl-01"
  region_name                         = "us-east1"
  nat_name                            = "eqgnat-o-gss-npr-us-01"
  router_name                         = "eqgrtr-o-gss-npr-us-01"
  source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  enable_endpoint_independent_mapping = false
  min_ports_per_vm                    = 1024
  log_config_enable                   = true
  log_config_filter                   = "ALL"
}

