# Create Random ID
resource "random_id" "instance_id" {
  byte_length = 4
}

# VM Name
locals {
  name = "antigua-${random_id.instance_id.hex}"
}

# Create IP
resource "google_compute_address" "static" {
  name = local.name
}

# Create VM
resource "google_compute_instance" "antigua-vm" {
  name         = local.name
  machine_type = var.e2-standard-4
  allow_stopping_for_update = true
  tags         = ["ssh","http"]
  labels = {
    "owner" = "anthonya"
  }

  boot_disk {
    initialize_params {
      image = var.windows_2022_sku
      size = 100
    }
  }
  
  metadata = {
    windows-startup-script-cmd = <<-EOT
      # Optional: Add startup commands here
    EOT
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }  

}