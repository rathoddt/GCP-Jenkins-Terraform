
resource "google_compute_instance_template" "myapp1" {
  name        = "${local.name}-myapp1-template"
  description = "This template is used to create app server instances."

  tags = [
    tolist(google_compute_firewall.fw_ssh.target_tags)[0],
    tolist(google_compute_firewall.fw_http.target_tags)[0]
  ]
  instance_description = "MyApp1 VM instances"
  machine_type         = var.machine_type
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  disk {
    source_image = data.google_compute_image.my_image.self_link
    auto_delete  = true
    boot         = true
  }


  network_interface {
    subnetwork = google_compute_subnetwork.subnet-01.id
    access_config {
      #Include this section for external IP

    }
  }

  metadata_startup_script = file("${path.module}/app1-webserver-install.sh")

  metadata = {
    environment = local.environment
  }

  labels = {
    environment = local.environment
  }

}



