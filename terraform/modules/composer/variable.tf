variable "project_id" {
  type = string
  description = "The unique identifier for the GCP project, used for organizing resources and billing."
}

variable "project_region" {
  type = string
  description = "The geographic region where the GCP resources will be deployed, affecting latency and compliance."
}

variable "service_account_name" {
  type = string
  description = "Service Account"
}

variable "composer_image_version" {
  type = string
  default = "composer-2.9.6-airflow-2.9.3"
  description = "composer image version"
}

variable "composer_name" {
  type = string
  description = "composer name"
}