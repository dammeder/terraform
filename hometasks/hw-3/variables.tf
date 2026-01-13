variable "aws_region" {
  type = string 
  description = "aws region"
  default = "us-east-1"
}

variable "tags" {
  description = "common tags"
  type = map(string)
  default = {
    "Name" = "hometask-3"
    "Env" = "dev"
  }
}

variable "vpc_cidr" {
    description = "cidr for vpc"
    type = string 
    default = "10.0.0.0/16"
}


variable "azs" {
  description = "availabilty zone"
  type = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnet_cidr" {
  description = "cids for public subent"
  type = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr" {
  description = "cidr for private subnets"
  type = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]

}