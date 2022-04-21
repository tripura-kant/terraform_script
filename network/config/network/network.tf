module "eqgvpc-o-gss-npr-us-01" {
  source       = "./modules/consul-cluster"
  network_name = "eqgvpc-o-gss-npr-us-01"
  project_id   = "qwiklabs-gcp-04-699dbd85ef70"
  routing_mode = "GLOBAL"

  subnets = [
     {
      subnet_name           = "eqgsne-o-gss-npr-usea1-01"
      subnet_ip             = "192.168.0.0/22"
      subnet_region         = "us-east1"
      subnet_flow_logs      = "true"
      description           = "Management Private Subnet of non-prod project"
      subnet_private_access = "true"
          
    },
    {
      subnet_name           = "eqgsne-o-gss-npr-usea1-02"
      subnet_ip             = "192.168.6.0/23"
      subnet_region         = "us-east1"
      subnet_flow_logs      = "true"
      description           = "Management Private Subnet of non-prod project"
      subnet_private_access = "true"
       
    }
  ]
  secondary_ranges = {
     eqgsne-o-gss-npr-usea1-01 = [
      {
        range_name    = "eqgsne-o-gss-npr-usea1-01-gke-pods-01"
        ip_cidr_range = "192.168.4.0/23"
      },
      {
        range_name    = "eqgsne-o-gss-npr-usea1-01-gke-services-01"
        ip_cidr_range = "192.168.240.0/26"
      }
    ]
  }
}

# resource "google_compute_subnetwork" "eqgsne-o-gss-npr-usea1-03" {

# provider     = google-beta
# project = "infgprj-gss-n-iacbst-gl-01"
# name = "eqgsne-o-gss-npr-usea1-03"
# ip_cidr_range = "192.168.8.0/23"
# region = "us-east1"
# purpose = "INTERNAL_HTTPS_LOAD_BALANCER"
# role = "ACTIVE"
# network = "projects/infgprj-gss-n-iacbst-gl-01/global/networks/eqgvpc-o-gss-npr-us-01"
# }