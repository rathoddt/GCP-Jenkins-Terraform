# Terraform block
terraform {
  #required_version = ">=1.9.3"
  required_version = "~>1.9.0" 
  # useful for production 1.9.x major.minor.patch, this stick to 1.8 and whatever patch vaialble
  required_providers {
    google = {
        source = "hashicorp/google"
        #version = ">=5.39.1"
        version = "~>5.39.0"
    }
  }
}



