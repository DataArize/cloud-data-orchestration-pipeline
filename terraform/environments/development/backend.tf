terraform {
    backend "gcs" {
        bucket = "terraform-prj01-cloud-data-orch"
        prefix = "terraform/state"
    }
}