provider "aws" {
    region = lookup(var.region, "aws")
}

module "container_registry" {
    source = "./modules/aws/ecr"
    create = true
    ecr_name = var.ecr_name
}