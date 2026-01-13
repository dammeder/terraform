variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "aws ec2 isntance type"
}

variable "tags" {
    description = "common tags"
    type = map(string)
    default = {
        "Name" = "aws-session-instance"
        "Environment" = "dev"
    }
}

