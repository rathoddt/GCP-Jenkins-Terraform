resource "google_cloud_run_v2_service" "run-v2" {
  name     = "cloudrun-v2"
  location = "asia-southeast1"
  ingress = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      #image = "us-docker.pkg.dev/cloudrun/container/hello"
      image = "gcr.io/google-samples/hello-app:2.0"
    }
  }
}


data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}


resource "google_cloud_run_service_iam_policy" "noauth" {
  #service  = google_cloud_run_v2_service.run-v2.id
  location = google_cloud_run_v2_service.run-v2.location
  #project  = google_cloud_run_service.run-v2.project
  service  = google_cloud_run_v2_service.run-v2.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
