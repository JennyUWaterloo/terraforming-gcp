// Allow esp access for VM in PCF deployment
resource "google_compute_firewall" "cf-esp" {
  name    = "${var.env_name}-cf-esp"
  network = "${google_compute_network.pcf-network.name}"

  allow {
    protocol = "esp"
  }

  source_ranges = [
    "52.204.73.71/32",
    "66.207.217.100/32",
    "209.234.137.222/32"
  ]
}
