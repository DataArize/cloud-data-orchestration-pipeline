resource "google_bigquery_dataset" "spotify_dataset" {
  project = var.project_id
  dataset_id                      = var.spotify_dataset_name
  description                     = "dataset description"
  location                        = var.project_region
}

resource "google_bigquery_table" "spotify_table" {
  project = var.project_id
  dataset_id          = google_bigquery_dataset.spotify_dataset.dataset_id
  table_id            = var.spotify_table_name
  deletion_protection = false
  schema = file("${path.module}/schema/${var.spotify_table_name}.json")
}