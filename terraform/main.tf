terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.44.1"
    }
  }
}

provider "google" {
  project     = var.PROJECT_ID
  region      = "us-central1"
}

# The following creates a Service Account
resource "google_service_account" "default" {
  account_id = "thats-what-she-sa-id"
  project    = var.PROJECT_ID
  display_name = "Service Account"
}

# The following creates a VM
resource "google_compute_instance" "default" {
  name        = "free-vm"
  description = "This template is used to create app server instances."

  tags = ["free", "vm"]

  labels = {
    environment = "free"
  }

  machine_type         = "e2-micro"
  can_ip_forward       = false
  zone                 = "us-west1-c"

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      labels = {
        ubuntu = "1804-lts"
      }
    }
  }

  network_interface {
    network = "default"
  }

  metadata = {
    vm = "free"
  }
}

data "google_compute_image" "ubuntu" {
  family  = "ubuntu-1804-lts"
  project = "ubuntu-os-cloud"
}

# The following creates a Standard Persistent Disk
resource "google_compute_disk" "free" {
  name  = "free-disk"
  image = data.google_compute_image.ubuntu.self_link
  size  = 10
  type  = "pd-standard"
  zone  = "us-west1-c"
}
