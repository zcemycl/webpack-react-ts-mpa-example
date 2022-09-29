output "lb_dns_name" {
    value = aws_lb.application_load_balancer.dns_name
}

output "lb_target_group_arn" {
    value = aws_lb_target_group.target_group.arn
}

output "lb_listener" {
    value = aws_lb_listener.listener
}