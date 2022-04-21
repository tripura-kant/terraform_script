module "eqgfwl-gss-napp-usea1-inw-alow-01" {
  source           = "git::https://source.developers.google.com/p/infgprj-gss-n-iacbst-gl-01/r/infgrep-gss-iac-mod-npr-01//modules/firewall/"
  firewall_name    = "eqgfwl-n-gss-usea1-inw-alow-01"
  network_name     = "eqgvpc-o-gss-npr-us-01"
  project_id       = "infgprj-gss-n-iacbst-gl-01"
  description      = "To allow SSH Access"
  direction        = "INGRESS"
  action           = "ALLOW"
  service_accounts = false
  source_tags      = ["eqgntg-ssh-inw-allow"]
  target_tags      = ["eqgntg-ssh-inw-allow"]
  flow_logs        = false

  protocol_ports = [
    {
      protocol = "tcp"
      ports    = ["22"]
    }
  ]
}

module "eqgfwl-gss-napp-usea1-inw-alow-02" {
  source           = "git::https://source.developers.google.com/p/eqgprj-n-iacbst-gl-01/r/terraform-google-firewall//firewall/"
  firewall_name    = "eqgfwl-n-gss-usea1-inw-alow-02"
  network_name     = "eqgvpc-o-gss-npr-us-01"
  project_id       = "infgprj-gss-n-iacbst-gl-01"
  description      = "To allow HTTP Access"
  direction        = "INGRESS"
  action           = "ALLOW"
  service_accounts = false
  source_tags      = ["eqgntg-http-inw-allow"]
  target_tags      = ["eqgntg-http-inw-allow"]
  flow_logs        = false

  protocol_ports = [
    {
      protocol = "tcp"
      ports    = ["80","443"]
    }
  ]
}

module "eqgfwl-gss-napp-usea1-inw-alow-iap" {
  source           = "git::https://source.developers.google.com/p/eqgprj-n-iacbst-gl-01/r/terraform-google-firewall//firewall/"
  firewall_name    = "eqgfwl-n-gss-usea1-inw-alow-iaps"
  network_name     = "eqgvpc-o-gss-npr-us-01"
  project_id       = "infgprj-gss-n-iacbst-gl-01"
  description      = "To allow IAP for SSH/RDP Access"
  direction        = "INGRESS"
  action           = "ALLOW"
  service_accounts = false
  ranges    = ["35.235.240.0/22"]
  //source_tags      = ["eqgntg-http-inw-allow"]
  //target_tags      = ["eqgntg-http-inw-allow"]
  flow_logs        = false

  protocol_ports = [
    {
      protocol = "tcp"
      ports    = ["22","3389",]
    }
  ]
}
