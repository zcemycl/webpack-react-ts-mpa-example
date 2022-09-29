output "ecr_arn" {
    description = "The arn of ecr object"
    value       = aws_ecr_repository.this[0].arn
}

output "ecr_registry_id" {
    description = "The registry id of the ecr"
    value       = aws_ecr_repository.this[0].registry_id
}

output "ecr_repo_url" {
    description = "Repo URL of the ecr"
    value       = aws_ecr_repository.this[0].repository_url
}