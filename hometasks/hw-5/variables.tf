variable "tags" {
  type = map(string)
  description = "common tag"
  default = {
    "project" = "terraform-hw-5"
    "manged_by" = "Terraform"
  }
}

variable "instance_type" {
    type = string 
    description = "ec2 instance"
    default = "t3.micro"
}


variable "region" {
  type = string
  description = "aws region"
  default = "us-east-1"
}

variable "ports" {
  type = list(string)
  description = "list of ports for alb ingress"
  default = ["80", "443"]
}