resource "google_compute_region_instance_group_manager" "myapp1" {
  name                       = "${local.name}-myapp1-mig"
  base_instance_name         = "${local.name}-myapp1"
  region                     = var.region
  distribution_policy_zones  = data.google_compute_zones.available_zones.names

  version {
    instance_template = google_compute_instance_template.myapp1.id
  }
  named_port {
    name = "webserver-port"
    port = 80
  }
  auto_healing_policies {
    health_check      = google_compute_region_health_check.myapp1.id
    initial_delay_sec = 300
  }

#   target_size  = 2
}