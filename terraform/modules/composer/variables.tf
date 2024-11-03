variable "project_id" {
  type        = string
  description = "The unique identifier for the GCP project for resource organization and billing."
  validation {
    condition     = length(var.project_id) > 0
    error_message = "The project_id must not be empty."
  }
}

variable "project_region" {
  type        = string
  description = "The GCP region where the resources will be deployed, impacting latency and compliance."
  validation {
    condition     = length(var.project_region) > 0
    error_message = "The project_region must be specified."
  }
}


variable "service_account_name" {
  type        = string
  description = "The name of the service account used for resource access."
  validation {
    condition     = length(var.service_account_name) > 0
    error_message = "The service_account_name must not be empty."
  }
}

variable "composer_name" {
  type = string
  description = "Name for the composer"
}

variable "composer_bucket_name" {
  type = string
  description = "Bucket name for composer"
}

variable "composer_image_version" {
  type = string
  default = "composer-2.9.6-airflow-2.9.3"
  description = "composer image version"
}