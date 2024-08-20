resource "google_compute_instance" "server-vm" {
  #Meta argument : count
  for_each = toset(data.google_compute_zones.available_zones.names)
  name         = "web-server-${each.key}"
  machine_type = var.machine_type
  zone         = each.key
  tags         = [tolist(google_compute_firewall.fw_ssh.target_tags)[0], tolist(google_compute_firewall.fw_http.target_tags)[0]]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet-01.id
    access_config {

    }
  }

  metadata_startup_script = file("${path.module}/app1-webserver-install.sh")

}