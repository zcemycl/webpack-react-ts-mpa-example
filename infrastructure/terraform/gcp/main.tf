terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~>4.0"
        }
    }

    cloud {
        organization = "limilim"

        workspaces {
            name = "gh-actions-demo"
        }
    }
}

provider "google" {
    region = var.gcp_region
    project = var.gcp_project
}

module "artifact_registry" {
    source = "./modules/ar"
    gcp_region = var.gcp_region
    gcp_project = var.gcp_project
}