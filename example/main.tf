module "prometheus" {
  providers = {
    nomad = nomad.razer
  }
  source = "../"

  # prometheus
  datacenters        = ["razer"]
  version            = "2.41.0"
  use_canary         = false
  use_host_volume    = false
  volume_destination = "/local/"
}