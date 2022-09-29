variable "region" {
    default = {
        aws = "eu-west-2"
        azure = ""
    }
}

variable "availability_zone" {
    default = {
        aws = "eu-west-2a"
    }
}

variable "ecr_name" {
    description = "The name of the elastic container registry. "
    type        = string
    default     = "leoacrghtf"
}

variable "public_subnets" {
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
    default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
    default = ["eu-west-2a", "eu-west-2b"]
}