variable "public_subnets" {
    description = "List of public subnets"
    type        = list
    default     = []
}

variable "availability_zones" {
    description = "List of availability_zones"
    type        = list
    default     = []
}