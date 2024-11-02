variable "dataset_name" {
  type        = string
  description = "Name of the BigQuery dataset for storing Spotify playlist data."
}

variable "dataset_description" {
  type        = string
  default     = "Dataset used for storing Spotify playlist data."
  description = "A detailed description of the BigQuery dataset."
}

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

variable "environment" {
  type        = string
  default     = "development"
  description = "Deployment environment (e.g., development, testing, production)."
  validation {
    condition     = contains(["development", "testing", "production"], var.environment)
    error_message = "Environment must be 'development', 'testing', or 'production'."
  }
}

variable "role_owner" {
  type        = string
  default     = "OWNER"
  description = "Role assigned to the project resources."
  validation {
    condition     = contains(["OWNER", "EDITOR", "VIEWER"], var.role_owner)
    error_message = "Role must be 'OWNER', 'EDITOR', or 'VIEWER'."
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

variable "table_name" {
  type        = string
  description = "Name of the BigQuery table for storing Spotify playlist data."
}

variable "table_description" {
  type        = string
  default     = "Table used for storing Spotify playlist data."
  description = "Description of the BigQuery table."
}

variable "schema_file_path" {
  type        = string
  default     = "./terraform/modules/bigquery/schema.json"
  description = "Path to the schema file for the BigQuery table (supports JSON or YAML formats)."
}
