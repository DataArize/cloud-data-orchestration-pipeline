resource "google_composer_environment" "composer" {
  name    = var.composer_name
  region  = var.project_region
  project = var.project_id

  storage_config {
    bucket = var.composer_bucket_name
  }

  config {
    node_config {
      service_account = var.service_account_name
    }
    software_config {
      image_version = var.composer_image_version
      env_variables = {
        DATASET_BUCKET_NAME: var.dataset_bucket_name
        SOURCE_FOLDER: var.source_folder_path
        ARCHIVE_FOLDER: var.archive_folder_path
        GCP_PROJECT_ID: var.project_id
        GCP_PROJECT_REGION: var.project_region
        CLUSTER_NAMESPACE: var.cluster_namespace
        CLUSTER_SERVICE_ACCOUNT_NAME: var.cluster_service_account_name
        ARTIFACTORY_IMAGE_NAME: var.artifactory_image_name
      }
    }

  }
}

data "google_composer_environment" "cluster_name" {
  name = google_composer_environment.composer.config[0].gke_cluster
  region = var.project_region
  project = var.project_id
  depends_on = [google_composer_environment.composer]
}