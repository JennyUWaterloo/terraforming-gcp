// Allow esp access for VM in PCF deployment
resource "google_compute_firewall" "cf-esp" {
  name    = "${var.env_name}-cf-esp"
  network = "${google_compute_network.pcf-network.name}"

  allow {
    protocol = "esp"
  }

  source_ranges = [
    "0.0.0.0/0"
  ]
}
