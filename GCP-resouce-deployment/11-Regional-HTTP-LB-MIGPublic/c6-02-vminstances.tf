resource "google_compute_instance_from_template" "myapp1" {
  for_each                 = toset(data.google_compute_zones.available_zones.names)
  name                     = "${local.name}-myapp-vm-${each.key}"
  zone                     = each.key
  source_instance_template = google_compute_instance_template.myapp1.self_link


}