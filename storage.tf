resource "google_storage_bucket" "terraform_state" {
  name          = "terraform-jenkins-state-bucket"
  location      = var.region
  force_destroy = false

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }
}

resource "google_storage_bucket" "jenkins_artifacts" {
  name          = "jenkins-artifacts-bucket"
  location      = var.region
  force_destroy = false

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 90
    }
    action {
      type = "Delete"
    }
  }
}

resource "google_storage_bucket_iam_binding" "jenkins_artifacts_access" {
  bucket = google_storage_bucket.jenkins_artifacts.name
  role   = "roles/storage.objectViewer"
  members = [
    "serviceAccount:${google_compute_instance.jenkins_server.service_account[0].email}"
  ]
}
