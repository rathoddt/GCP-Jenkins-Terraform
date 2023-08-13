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
     size = 35
   }

   auto_delete = true
  }

  labels ={
    "env"="dev"
    "team" = "rose"
  }

  # scheduling {
  #   preemptible = true   
  #   automatic_restart = false 
  # }


  lifecycle {
    ignore_changes = [attached_disk]
  }


  allow_stopping_for_update = true
  service_account {
    email = "terraform-gcp@serverless-gcp-391314.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  
}


resource "google_compute_disk" "pd-disk-sec" {
  name  = "disk-sec"
  type  = "pd-ssd"
  zone  = "asia-southeast1-c"
  size = 40
  labels = {
    environment = "dev"
  }
  
}

resource "google_compute_attached_disk" "sec-disc-to-tf-vm" {
  disk     = google_compute_disk.pd-disk-sec.id
  instance = google_compute_instance.appserver-tf.id
}