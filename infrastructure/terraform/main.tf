terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.32.0"
        }
        random = {
            source = "hashicorp/random"
            version = "3.0.1"
        }
    }
    required_version = ">= 1.1.0"

    cloud {
        organization = "limilim"

        workspaces {
            name = "gh-actions-demo"
        }
    }
}


provider "aws" {
    region = lookup(var.region, "aws")
}

module "container_registry" {
    source = "./modules/aws/ecr"
    create = true
    ecr_name = var.ecr_name
}

module "iam_ecs" {
    source = "./modules/aws/iam"
}

module "vpc" {
    source = "./modules/aws/vpc"
    public_subnets = var.public_subnets
    availability_zones = var.availability_zones
}