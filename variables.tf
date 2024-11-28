variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "VM Instance type"
  type        = string
  default     = "e2-medium"
}

variable "terraform_state_bucket" {
  description = "GCS bucket for terraform state"
  type        = string
  default     = "terraform-jenkins-state-bucket"
}
