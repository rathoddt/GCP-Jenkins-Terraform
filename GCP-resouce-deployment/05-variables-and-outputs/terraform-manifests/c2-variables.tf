variable "gcp_project" {
    description = "GCP priject name"
    type = string
    default = "My First Project"  
}

variable "region" {
    description = "Traget region"
    type = string
    default = "us-central1"  
}

variable "machine_type" {
    description = "VM machine type"
    type = string
    default = "e2-small"  
}
