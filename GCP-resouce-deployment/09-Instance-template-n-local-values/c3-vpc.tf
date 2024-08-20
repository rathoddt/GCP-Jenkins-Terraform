# Resource block 
resource "google_compute_network" "vpc_network1" {
  name                    = "${local.name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet-01" {
  name          = "subnet-01"
  region        = var.region
  #region        = "us-central1"
  ip_cidr_range = "10.128.0.0/20"
  network       = google_compute_network.vpc_network1.id

}
