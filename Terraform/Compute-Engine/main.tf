resource "google_compute_instance" "appserver-tf" {
  name = "appserver-tf"
  zone = "asia-southeast1-c"
  machine_type="e2-micro"
  network_interface{
   network="vpc-custom-tf"
   subnetwork = "sub-sg"
  }

  boot_disk{
   initialize_params{
     image = "ubuntu-minimal-2204-lts"
     size = 20
   }
  }
}