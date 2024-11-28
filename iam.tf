resource "google_service_account" "jenkins_sa" {
  account_id   = "jenkins-service-account"
  display_name = "Jenkins Service Account"
}

resource "google_project_iam_member" "jenkins_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.jenkins_sa.email}"
}
