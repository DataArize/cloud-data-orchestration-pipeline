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

variable "change_storage_type" {
  type = string
  default = "SetStorageClass"
  description = "The action to take for changing the storage class of the objects in the storage bucket. This can help in optimizing storage costs based on data access patterns."
}

variable "nearline_storage_class" {
  type = string
  default = "NEARLINE"
  description = "The storage class used for objects that are accessed less than once a month, suitable for infrequently accessed data."
}

variable "coldline_storage_class" {
  type = string
  default = "COLDLINE"
  description = "The storage class used for objects that are accessed less than once a year, designed for long-term storage of infrequently accessed data."
}

variable "archive_storage_class" {
  type = string
  default = "ARCHIVE"
  description = "The storage class used for objects that are rarely accessed, suitable for long-term retention and archiving of data."
}

variable "delete" {
  type = string
  default = "Delete"
  description = "The action type to perform on the storage bucket or its contents, indicating whether to delete objects based on the specified age."
}

variable "log_object_prefix" {
  type = string
  default = "logs-"
  description = "The prefix to use for log object names in the storage bucket, helping in organizing and identifying log files easily."
}

variable "logging_bucket" {
  type = string
  description = "The name of the Google Cloud Storage bucket where logs will be stored. It must be globally unique across GCP."
}

variable "dataflow_bucket" {
  type = string
  description = "The name of the Google Cloud Storage bucket where dataflow code will be stored. It must be globally unique across GCP."
}


