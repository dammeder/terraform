variable "env" {
    type = string 
    description = "environment"
    default = "dev"
  
}

variable "instance_type" {
  type = string 
  description = "ec2 instance"
  default = "t3.micro"
}

variable "tags" {
  type = map(string)
  description = "common tag"
  default = {
    "Project" = "aws-session"
    "Managed_by" = "terraform"
  }
}

variable "ports" {
  type = list(string)
  description = "list of ports"
  default = [ "22", "80", "443", "3306", "5432" ]
}