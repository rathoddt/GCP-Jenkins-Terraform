resource "google_compute_address" "lb-static-ipadd" {
  name = "${local.name}-lb-static-ipadd"
}

resource "google_compute_region_health_check" "lb-healthcheck" {
  name = "${local.name}-myapp-lb-healthcheck"

  timeout_sec         = 5
  check_interval_sec  = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3

  http_health_check {
    port         = "80"
    request_path = "/index.html"
  }
}


resource "google_compute_region_backend_service" "lb-backend-service" {
  name                  = "${local.name}-myapp-lb-backend-service"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  health_checks         = [google_compute_region_health_check.lb-healthcheck.self_link]
  port_name             = "webserver-port"
  backend {
    group           = google_compute_region_instance_group_manager.myapp1.instance_group
    capacity_scaler = 1.0
    balancing_mode  = "UTILIZATION"
  }
}


resource "google_compute_url_map" "lb-url-map" {
  name            = "${local.name}-lb-url-map"
  default_service = google_compute_region_backend_service.lb-backend-service.self_link
}

resource "google_compute_region_target_http_proxy" "my-lb-http-proxy" {
  region  = "${local.name}-my-lb-http-proxy"
  name    = "http-proxy"
  url_map =google_compute_url_map.lb-url-map.id
}


// Forwarding rule for Regional External Load Balancing
resource "google_compute_forwarding_rule" "lb-fw-rule" {

  name                  = "${local.name}-lb-fw-rule"
  region                = "us-central1"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "80"
  ip_address            = google_compute_address.lb-static-ipadd.address
  target                = google_compute_region_target_http_proxy.my-lb-http-proxy.id
  network               = google_compute_network.vpc_network1.id
  depends_on            = [google_compute_subnetwork.regional_proxy_subnet]
}