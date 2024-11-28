resource "google_compute_instance" "jenkins_server" {
  name         = "jenkins-server"
  machine_type = var.machine_type
  tags         = ["jenkins"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size  = 50
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.jenkins_subnet.id
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("${path.module}/scripts/install_jenkins.sh")

  service_account {
    email  = google_service_account.jenkins_sa.email
    scopes = ["cloud-platform"]
  }
}
