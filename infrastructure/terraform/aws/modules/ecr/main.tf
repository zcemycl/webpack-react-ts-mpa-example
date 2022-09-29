resource "aws_ecr_repository" "this" {
    count = var.create?1:0
    name  = var.ecr_name
    force_delete = true
}
