variable "gcp_project" {
    description = "GCP priject name"
    type = string
    default = "terraform-poc-01"  
}

variable "region" {
    description = "Traget region"
    type = string
    default = "us-central1"  
}

variable "zone" {
    description = "Traget region"
    type = string
    default = "us-central1-a"  
}

variable "machine_type" {
    description = "VM machine type"
    type = string
    default = "e2-small"  
}
