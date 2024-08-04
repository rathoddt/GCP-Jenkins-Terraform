# data "google_compute_zones" "available_zones" {
#     status = "UP"  
# }

# output "compute_zones" {
#     value = data.google_compute_zones.available_zones.names

# }

#https://registry.terraform.io/providers/hashicorp/google/4.55.0/docs/data-sources/compute_image
data "google_compute_image" "my_image" {
#   family  = "debian-11"
#   project = "debian-cloud"
  # CentOs
  project = "centos-cloud"  
  family  = "centos-stream-9"

  # RedHat
  #project = "rhel-cloud" 
  #family  = "rhel-9"

  # Ubuntu
  #project = "ubuntu-os-cloud"
  #family  = "ubuntu-2004-lts"

  # Microsoft
  #project = "windows-cloud"
  #family  = "windows-2022"

  # Rocky Linux
  #project = "rocky-linux-cloud"
  #family  = "rocky-linux-8"      
}

output "vmimage_info" {
  value = {
    project   = data.google_compute_image.my_image.project
    family    = data.google_compute_image.my_image.family
    name      = data.google_compute_image.my_image.name
    image_id  = data.google_compute_image.my_image.image_id
    status    = data.google_compute_image.my_image.status
    id        = data.google_compute_image.my_image.id
    self_link = data.google_compute_image.my_image.self_link
  }
}
