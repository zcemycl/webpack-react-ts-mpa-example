variable "create" {
    description = "Whether to create this resource or not?"
    type        = bool
    default     = true
}

variable "ecr_name" {
    description = "The name of the elastic container registry. "
    type        = string
    default     = ""
}
