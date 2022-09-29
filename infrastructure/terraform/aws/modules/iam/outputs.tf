output "iam_ecs_agent_name" {
    value = aws_iam_instance_profile.ecs_agent.name
}

output "iam_ecs_task_exec_arn" {
    value = aws_iam_role.ecsTaskExecutionRole.arn
}