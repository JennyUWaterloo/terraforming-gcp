// Allow winrm and rdp access for VM in PCF deployment
resource "google_compute_firewall" "cf-winrm-rdp" {
  name    = "${var.env_name}-cf-winrm-rdp"
  network = "${google_compute_network.pcf-network.name}"

  allow {
    protocol = "tcp"
    ports = [ "5985-5986", "3389" ]
  }

  allow {
    protocol = "udp"
    ports = [ "3389" ]
  }

  source_ranges = [
    "52.204.73.71/32",
    "66.207.217.100/32",
    "209.234.137.222/32"
  ]
}
