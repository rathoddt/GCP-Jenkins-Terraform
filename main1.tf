provider "google" {
  version = "3.5.0"

  credentials = file("terrafrom-key.json")

  project = "playground-s-11-bc491a94"
  region  = "us-east1"
  zone    = "us-east1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}