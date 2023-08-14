terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.76.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "serverless-gcp-391314"
  region      = "us-east1"
  zone        = "us-east1-c"
  credentials = "../terraform-key.json"
}