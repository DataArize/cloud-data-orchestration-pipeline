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
  type        = string
  default     = "development"
  description = "Deployment environment (e.g., development, testing, production)."
  validation {
    condition     = contains(["development", "testing", "production"], var.environment)
    error_message = "Environment must be 'development', 'testing', or 'production'."
  }
}

variable "storage_bucket" {
  type = string
  description = "The name of the Google Cloud Storage bucket where datasets will be stored. It must be globally unique across GCP."
}

variable "logging_bucket" {
  type = string
  description = "The name of the Google Cloud Storage bucket where logs will be stored. It must be globally unique across GCP."
}

variable "dataflow_bucket" {
  type = string
  description = "The name of the Google Cloud Storage bucket where dataflow code will be stored. It must be globally unique across GCP."
}

variable "dataset_name" {
  type        = string
  description = "Name of the BigQuery dataset for storing Spotify playlist data."
}

variable "service_account_name" {
  type        = string
  description = "The name of the service account used for resource access."
  validation {
    condition     = length(var.service_account_name) > 0
    error_message = "The service_account_name must not be empty."
  }
}

variable "table_name" {
  type        = string
  description = "Name of the BigQuery table for storing Spotify playlist data."
}

variable "owner_email" {
  type = string
  description = "Email of the user"
}