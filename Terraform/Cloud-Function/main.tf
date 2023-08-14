resource "google_storage_bucket_object" "GCS1" {
  bucket = "terraform-bkt-backend-03"
  name = "index.zip"
  source = "index.zip"
}
