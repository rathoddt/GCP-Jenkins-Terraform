resource "google_project_iam_binding" "viewer" {
  project = var.project_id
  role    = "roles/viewer"
  #Adding project viewver role
  members = [
    "user:rathod.dt@gmail.com",
  ]
}
