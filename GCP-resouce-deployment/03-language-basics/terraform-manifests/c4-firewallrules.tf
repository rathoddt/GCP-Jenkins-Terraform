resource "google_compute_firewall" "fw_ssh" {
  name      = "fwrule-allow-ssh"
  network   = google_compute_network.vpc_network.id
  direction = "INGRESS"
  priority  = 1100
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-tag"]
}


resource "google_compute_firewall" "fw_http" {
  name      = "fwrule-allow-http80"
  network   = google_compute_network.vpc_network.id
  direction = "INGRESS"
  priority  = 1100
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["webserver-tag"]
}
