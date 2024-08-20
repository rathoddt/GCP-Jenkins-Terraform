# Prtovider block 1
provider "google" {
  project = "terraform-poc-01"
  region  = "us-central1"
  alias = "us-central1"
}

# Prtovider block 2
provider "google" {
  project = "terraform-poc-01"
  region  = "europe-west1"
  alias = "europe-west1"
}