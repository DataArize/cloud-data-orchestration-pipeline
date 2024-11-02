variable "project_id" {
  type = string
  description = "The unique identifier for the GCP project, used for organizing resources and billing."
}

variable "project_region" {
  type = string
  description = "The geographic region where the GCP resources will be deployed, affecting latency and compliance."
}

variable "spotify_dataset_name" {
  type = string
  description = "spotify dataset name"
}

variable "spotify_table_name" {
  type = string
  description = "spotify table name"
}