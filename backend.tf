terraform {
  backend "gcs" {
    bucket = "terraform-jenkins-state-bucket"
    prefix = "terraform/state"
  }
}
