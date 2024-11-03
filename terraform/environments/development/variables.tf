variable "project_id" {
  type = string
  description = "The unique identifier for the GCP project, used for organizing resources and billing."
}

variable "project_region" {
  type = string
  description = "The geographic region where the GCP resources will be deployed, affecting latency and compliance."
}

variable "delete_age" {
  type = number
  description = "The duration, in days, after which objects in the storage bucket are eligible for deletion. This helps in managing storage costs and compliance."
}

variable "access_prevention_policy" {
  type = string
  description = "The access prevention policy for the storage bucket. This policy can restrict access to ensure data security, especially for sensitive data."
}

variable "nearline_storage_age" {
  type = number
  description = "The duration, in days, that objects must remain in Nearline storage class before they can be deleted. Nearline is suitable for data that is accessed less than once a month."
}

variable "coldline_storage_age" {
  type = number
  description = "The duration, in days, that objects must remain in Coldline storage class before they can be deleted. Coldline is suitable for data that is accessed less than once a year."
}

variable "archive_storage_age" {
  type = number
  description = "The duration, in days, that objects must remain in Archive storage class before they can be deleted. Archive is suitable for data that is rarely accessed and stored for long-term retention."
}

variable "environment" {
  type = string
  default = "development"
  description = "The environment where the resources will be deployed (e.g., development, testing, production). This helps in distinguishing between different stages of resource management."
}

variable "storage_bucket" {
  type = string
  description = "The name of the Google Cloud Storage bucket where datasets will be stored. It must be globally unique across GCP."
}

variable "logging_bucket" {
  type = string
  description = "The name of the Google Cloud Storage bucket where logs will be stored. It must be globally unique across GCP."
}

variable "service_account_name" {
  type = string
  description = "Service Account"
}

variable "composer_name" {
  type = string
  description = "composer name"
}

variable "spotify_dataset_name" {
  type = string
  description = "spotify dataset name"
}

variable "spotify_table_name" {
  type = string
  description = "spotify table name"
}

variable "composer_bucket" {
  type = string
  description = "composer bucket"
}