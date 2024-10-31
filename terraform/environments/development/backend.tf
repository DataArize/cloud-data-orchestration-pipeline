terraform {
    backend "gcs" {
        bucket = "terraform-cloud-data-orchestration-pipeline"
        prefix = "terraform/state"
    }
}