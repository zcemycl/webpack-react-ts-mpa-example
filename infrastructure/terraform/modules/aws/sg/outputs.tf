output "sg_lb_id" {
    value = aws_security_group.load_balancer_security_group.id
}

output "sg_service_id" {
    value = aws_security_group.service_security_group.id
}