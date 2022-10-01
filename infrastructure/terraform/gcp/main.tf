terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~>4.0"
        }
    }
}

provider "google" {
    region = var.gcp_region
    project = var.gcp_project
}

module "artifact_registry" {
    source = "./module/ar"
    gcp_region = var.gcp_region
    gcp_project = var.gcp_project
}