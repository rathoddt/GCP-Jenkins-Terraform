  variable "zone_machine_map" {
    type = map(string)
    default ={
      "us-central1-a" = "e2-micro"
      "us-central1-b" = "e2-small"
      "us-central1-c" = "e2-medium"    
    }
  }

resource "google_compute_instance" "server-vm" {
  #Meta argument : count


  for_each = var.zone_machine_map  
  name         = "web-server-${each.key}"
  machine_type = each.value
  zone         = each.key
  tags         = [
                  tolist(google_compute_firewall.fw_ssh.target_tags)[0], 
                  tolist(google_compute_firewall.fw_http.target_tags)[0]
                ]
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