# Resource block 
resource "google_compute_network" "vpc_network1" {
  name                    = "${local.name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet-01" {
  name   = "${var.region}-subnet"
  region = var.region
  #region        = "us-central1"
  ip_cidr_range = "10.128.0.0/20"
  network       = google_compute_network.vpc_network1.id

}


resource "google_compute_subnetwork" "regional_proxy_subnet" {
  name   = "${var.region}-regional-proxy-subnet"
  region = var.region
  #region        = "us-central1"
  ip_cidr_range = "10.0.0.0/24"
  purpose       = "REGIONAL_MANAGED_PROXY"
  role          = "ACTIVE"
  network       = google_compute_network.vpc_network1.id

}