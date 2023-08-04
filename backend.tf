terraform {
  backend "gcs" {
    bucket = "terraform-vpc-bkt"
    prefix = "terrafrom-st-file"
    credentials = "terrafrom-key.json"
   }
}