resource "google_compute_network" "vpc-auto" {
  name = "vpc-auto-tf"
  auto_create_subnetworks = true
}

resource "google_compute_network" "vpc-custom" {
  name = "vpc-custom-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-in-custom-vpc" {    
  name          = "sub-sg"
  ip_cidr_range = "10.1.0.0/24"
  region        = "asia-southeast1"
  network       = google_compute_network.vpc-custom.id        
  private_ip_google_access = true
  secondary_ip_range {
    range_name    = "sec-cidr-range"
    ip_cidr_range = "192.168.10.0/24"
  }
}

resource "google_compute_firewall" "allow-icmp" {
  name    = "allow-icmp-fw-rule"
  network = google_compute_network.vpc-custom.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
//    ports    = ["80", "8080", "1000-2000"]
  }

  //source_tags = ["web"]
  source_ranges = ["106.213.80.187/32"]
  priority = 500
}
