resource "google_storage_bucket_object" "GCS1" {
  bucket = "terraform-bkt-backend-03"
  name = "index.zip"
  source = "index.zip"
}

resource "google_cloudfunctions_function" "function" {
  name        = "cfun-tf"
  description = "My function using terraform"
  runtime     = "nodejs20"

  available_memory_mb   = 128
  source_archive_bucket = "terraform-bkt-backend-03"
  source_archive_object = google_storage_bucket_object.GCS1.name
  trigger_http          = true
  entry_point           = "helloHttp-tf"
}



resource "google_cloudfunctions_function_iam_member" "member" {
  project = google_cloudfunctions_function.function.project
  region = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name
  role = "roles/cloudfunctions.invoker"
  member = "allUsers"
}