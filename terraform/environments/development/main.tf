module "cloud_storage" {
  source = "../../modules/storage"
  project_id = var.project_id
  project_region = var.project_region
  access_prevention_policy = var.access_prevention_policy
  archive_storage_age = var.archive_storage_age
  coldline_storage_age = var.coldline_storage_age
  delete_age = var.delete_age
  logging_bucket = var.logging_bucket
  nearline_storage_age = var.nearline_storage_age
  storage_bucket = var.storage_bucket
  dataflow_bucket = var.dataflow_bucket
}

module "bigquery" {
  source = "../../modules/bigquery"
  dataset_name = var.dataset_name
  project_id = var.project_id
  project_region = var.project_region
  service_account_name = var.service_account_name
  table_name = var.table_name
  owner_email = var.owner_email
}