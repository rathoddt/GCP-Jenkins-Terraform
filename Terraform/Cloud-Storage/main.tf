resource "google_storage_bucket" "GCS1" {
  name          = "terraform-bkt-backend-03"
  location      = "US"
  storage_class = "NEARLINE"
  labels = {
    "env"  = "test"
    "dept" = "account"
  }

  uniform_bucket_level_access = false

  lifecycle_rule {
    condition {
      age = 5
    }
    action {
      storage_class = "COLDLINE"
      type          = "SetStorageClass"
    }
  }

  retention_policy {
    is_locked        = true
    retention_period = 864000
  }

}


resource "google_storage_bucket_object" "picture" {
  name   = "rock-n-lake.jpg"
  source = "rock-n-lake.jpg"
  //bucket = "terraform-bkt-backend-02"
  bucket = google_storage_bucket.GCS1.name
}