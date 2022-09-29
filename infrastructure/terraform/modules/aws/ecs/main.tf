resource "aws_ecs_task_definition" "dash_task" {
    family = "dash"
    container_definitions = jsonencode([
        {
            name = "dash"
            image = "${var.ecr_repo_url}:latest"
            cpu = 1
            memory = 512
            essential = true
            environment = []
            portMappings = [
                {
                    containerPort = var.port
                    hostPort = var.port
                    protocol = "tcp"
                }
            ]
        }
    ])
    requires_compatibilities = ["EC2"]
    network_mode = "awsvpc"
    memory = 512
    cpu = 512
    execution_role_arn       = "${var.iam_ecs_task_exec_arn}"
    task_role_arn = "${var.iam_ecs_task_exec_arn}"
}

resource "aws_ecs_service" "dash_service" {
    name            = "dash-service"
    launch_type = "EC2"
    cluster         = aws_ecs_cluster.dash_cluster.id
    task_definition = aws_ecs_task_definition.dash_task.arn
    desired_count   = 2
    network_configuration {
        subnets = var.subnets
        assign_public_ip = false
        security_groups = [
            var.sg_service_id,
            var.sg_lb_id
        ]
    }

    load_balancer {
        target_group_arn = var.lb_target_group_arn
        container_name   = "dash"
        container_port   = var.port
    }

    depends_on = [var.lb_listener]
}

resource "aws_ecs_cluster" "dash_cluster" {
    name = "dash-cluster"
}