variable "region" {
  type = string
  description = "aws region"
  default = "us-east-1"
}

variable "domain_name" {
  type = string
  description = "domain name for meder-cool-guy.com"
  default = "meder-cool-guy.com"
}

variable "sub_domain" {
  type = string 
  description = "subdomain for meder-cool-guy.com"
  default = "hw"
}