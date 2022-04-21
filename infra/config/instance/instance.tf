module "compute_instance_sonarqube" {
  source     = "./modules/consul-cluster"
  project_id    = "qwiklabs-gcp-01-0f500976f71e"
  instance_name = "test-vm-sonarqube"
  machine_type  = "e2-standard-8"
  allow_stopping_for_update = true
  zone_name                 = "us-east1-b"
  tags                      = ["http-server"]
  #attached_disk = [{
  # source = module.compute_disk_sonarqube.self_link
  #  }
  #]
  deletion_protection = false
  # network_interface = [{
  #   network_name       = "projects/infgprj-gss-n-iacbst-gl-01/global/networks/eqgvpc-o-gss-npr-us-01"
  #   external_ip_needed = "false"
  #   subnetwork_name    = "projects/infgprj-gss-n-iacbst-gl-01/regions/us-east1/subnetworks/eqgsne-o-gss-npr-usea1-01"
  #   network_ip         = module.compute_address_internal_sonarqube.regional_ip_addresses[0]
  #   access_config      = [{
  #     nat_ip= null
  #     network_tier = "PREMIUM"
  #     }]
  #   alias_ip_range     = {}
  # }
  # ]

  #boot_disk     = { image = "projects/centos-cloud/global/images/centos-7-v20211214" }   
  labels        = { "resource" : "instance" }
  metadata_list = { "startup-script-url" : "gs://startup-script-test/startup.sh" }  // to be updated

  shielded_instance_config = {enable_secure_boot = true}
  service_account = {
    email  = "qwiklabs-gcp-01-0f500976f71e@qwiklabs-gcp-01-0f500976f71e.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
 // policy_name = "policy"
}
# module "compute_disk_sonarqube" {
#   source     = "git::https://source.developers.google.com/p/infgprj-gss-n-iacbst-gl-01/r/infgrep-gss-iac-mod-npr-01//modules/compute-disk/"
#   disk_name  = "eqgced-nsrql-usea1-0006"
#   project_id = "infgprj-gss-n-iacbst-gl-01"
#   disk_type  = "pd-ssd"
#   zone_name  = "us-east1-b"
#   labels     = { "environment" : "non-prod" }
#   size       = 10
#   physical_block_size_bytes = 4096
#   snapshot_policy_name = ""
# }

# module "compute_address_internal_sonarqube"{
#   source     = "git::https://source.developers.google.com/p/infgprj-gss-n-iacbst-gl-01/r/infgrep-gss-iac-mod-npr-01//modules/compute-address/"
#   project_id = "infgprj-gss-n-iacbst-gl-01"
#   address_names        = ["sonarqube-internal-address-1"]
#   subnetwork_name   = "projects/infgprj-gss-n-iacbst-gl-01/regions/us-east1/subnetworks/eqgsne-o-gss-npr-usea1-01"
#   address_type = "INTERNAL"
#   ip_addresses      = ["192.168.0.9"]    
#   region_name       = "us-east1"
# }

