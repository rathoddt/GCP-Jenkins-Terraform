provider "google" {
  credentials=file("/home/vagrant/git-repos/GCP-Jenkins-Terraform/GCP-resouce-deployment/keys/tf-key.json")
  project = "terraform-poc-01"
  region  = "asia-south1"
  zone    = "asia-south1-a"
}
resource "google_compute_network" "vpc_network" {
  name       = "terraform-network"
}

terraform {
  backend "gcs" {
    bucket = "terraform-bkt-poc-01"
    prefix = "tf-state-files/vpc-01" #path
    #credentials="$GOOGLE_APPLICATION_CREDENTIALS"
    credentials = "/home/vagrant/git-repos/GCP-Jenkins-Terraform/GCP-resouce-deployment/keys/tf-key.json"
  }
}