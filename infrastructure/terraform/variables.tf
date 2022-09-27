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