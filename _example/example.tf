provider "google" {
  project = "opz0-397319"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}
###############################################(vpc)##################################################
module "vpc" {
  source                                    = "git::git@github.com:opsstation/terraform-gcp-vpc.git?ref=master"
  name                                      = "testk"
  environment                               = "test"
  label_order                               = ["name", "environment"]
  project                                   = "opz0-397319"
  mtu                                       = 1460
  routing_mode                              = "REGIONAL"
  google_compute_network_enabled            = true
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  delete_default_routes_on_create           = false
}

#############################################(firewall)#################################################
module "firewall" {
  source        = "./../."
  name          = "app"
  environment   = "test"
  label_order   = ["name", "environment"]
  project_id    = "opz0-397319"
  network       = module.vpc.vpc_id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]

  allow = [
    { protocol = "tcp"
      ports    = ["22", "80"]
    }
  ]
}