output "ecr_arn" {
    value = module.container_registry.ecr_arn
}

output "ecr_registry_id" {
    value = module.container_registry.ecr_registry_id
}

output "ecr_repo_url" {
    value = module.container_registry.ecr_repo_url
}

output "lb_dns_name" {
    value = module.lb.lb_dns_name
}