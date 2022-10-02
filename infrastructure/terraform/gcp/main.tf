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
    credentials = file("./credentials.json")
}

module "artifact_registry" {
    source = "./modules/ar"
    gcp_region = var.gcp_region
    gcp_project = var.gcp_project
    ar_repo_id = var.ar_repo_id
}

module "cloudrun" {
    source = "./modules/cloudrun"
    create = var.stage2_deploy
    gcp_region = var.gcp_region
    gcp_project = var.gcp_project
    ar_repo_id = var.ar_repo_id
    image_name = var.image_name
    image_tag = var.image_tag
}