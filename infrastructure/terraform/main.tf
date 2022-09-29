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

module "sg" {
    source = "./modules/aws/sg"
    vpc_id = module.vpc.vpc_id
}

module "lb" {
    source = "./modules/aws/lb"
    subnets = module.vpc.public_subnet_ids
    vpc_id = module.vpc.vpc_id
    sg_id = module.sg.sg_lb_id
}

module "ecs" {
    source = "./modules/aws/ecs"
    ecr_repo_url = module.container_registry.ecr_repo_url
    iam_ecs_task_exec_arn = module.iam_ecs.iam_ecs_task_exec_arn
    sg_service_id = module.sg.sg_service_id
    sg_lb_id = module.sg.sg_lb_id
    subnets = module.vpc.public_subnet_ids
    lb_target_group_arn = module.lb.lb_target_group_arn
    lb_listener = module.lb.lb_listener
}

module "autoscale" {
    source = "./modules/aws/autoscale"
    iam_ecs_agent_name = module.iam_ecs.iam_ecs_agent_name
    sg_service_id = module.sg.sg_service_id
    subnets = module.vpc.public_subnet_ids
}