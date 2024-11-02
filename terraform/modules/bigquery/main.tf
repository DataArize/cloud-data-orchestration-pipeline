resource "google_bigquery_dataset" "bigquery_dataset" {
  dataset_id = var.dataset_name
  description = var.dataset_description
  location = var.project_region
  project = var.project_id

  access {
    role = var.role_owner
    user_by_email = var.service_account_name
  }

  labels = {
    environment = var.environment
  }

  delete_contents_on_destroy = true

}


resource "google_bigquery_table" "bigquery_table" {
  dataset_id = google_bigquery_dataset.bigquery_dataset.dataset_id
  table_id   = var.table_name
  project = var.project_id
  description = var.table_description
  schema = file(var.schema_file_path)

  labels = {
    environment = var.environment
  }
}