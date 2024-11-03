output "composer_bucket_name" {
  value = google_storage_bucket.composer_bucket.name
  description = "The name of the Google Cloud Storage bucket where composer related files will be stored. It must be globally unique across GCP."
}

output "composer_bucket" {
  value = google_storage_bucket.composer_bucket
}