module "eqgrtr-o-gss-npr-us-01" {
  source       = "git::https://source.developers.google.com/p/infgprj-gss-n-iacbst-gl-01/r/infgrep-gss-iac-mod-npr-01//modules/cloud-router/"
  router_name  = "eqgrtr-o-gss-npr-us-01"
  network_name = "projects/eqgprj-gss-n-devops-us-01/global/networks/eqgvpc-o-gss-npr-us-01"
  region_name  = "us-east1"
  project_id   = "infgprj-gss-n-iacbst-gl-01"
 }
 
