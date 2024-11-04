output "cluster_name" {
  value = google_composer_environment.composer.config[0].gke_cluster
}