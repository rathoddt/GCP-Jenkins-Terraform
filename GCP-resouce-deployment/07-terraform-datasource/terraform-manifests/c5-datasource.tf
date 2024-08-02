data "google_compute_zones" "available_zones" {
    status = "UP"  
}

output "compute_zones" {
    value = data.google_compute_zones.available_zones.names
  
}