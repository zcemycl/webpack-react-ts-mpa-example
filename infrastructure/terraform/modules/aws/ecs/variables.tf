variable "ecr_repo_url" {
    default = ""
}

variable "iam_ecs_task_exec_arn" {
    default = ""
}

variable "sg_service_id" {
    default = ""
}

variable "sg_lb_id" {
    default = ""
}

variable "port" {
    default = 3000
}

variable "subnets" {
    default = []
}

variable "lb_target_group_arn" {
    default = ""
}

variable "lb_listener" {
    default = ""
}