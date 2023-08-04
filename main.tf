terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.76.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "playground-s-11-bc491a94"
  region  = "us-east1"
  zone    = "us-east1-c"
}

resource google_storage_bucket "GCS1"{
  name="terraform-bkt-0001"
  location      = "US"
}