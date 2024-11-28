output "jenkins_public_ip" {
  description = "Public IP address of the Jenkins server"
  value       = google_compute_instance.jenkins_server.network_interface[0].access_config[0].nat_ip
}

output "jenkins_url" {
  description = "URL to access Jenkins"
  value       = "http://${google_compute_instance.jenkins_server.network_interface[0].access_config[0].nat_ip}:8080"
}
