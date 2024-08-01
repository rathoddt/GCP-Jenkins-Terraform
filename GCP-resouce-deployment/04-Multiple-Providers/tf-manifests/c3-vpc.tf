# Resource block 
resource "google_compute_network" "vpc_network" {
  name                    = "vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet-01" {
  provider = google.us-central1
  name          = "subnet-01"  
  ip_cidr_range = "10.128.0.0/20"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "subnet-02" {
  provider = google.europe-west1
  name          = "subnet-01"  
  ip_cidr_range = "10.132.0.0/20"
  network       = google_compute_network.vpc_network.id

}