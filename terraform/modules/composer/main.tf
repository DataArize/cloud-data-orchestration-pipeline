resource "google_composer_environment" "composer" {
  name    = var.composer_name
  region  = var.project_region
  project = var.project_id
  depends_on = [var.composer_name]

  storage_config {
    bucket = var.composer_bucket_name
  }

  config {
    node_config {
      service_account = var.service_account_name
    }
    software_config {
      image_version = var.composer_image_version
    }

  }
}