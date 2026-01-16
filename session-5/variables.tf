variable "org" {
    type = string
    description = "organization"
    default = "netflix"
}

variable "dep" {
  type = string
  description = "Department"
  default = "it"
}

variable "bu" {
  type = string 
  description = "Domain/Business Unit"
  default = "ai"
}

variable "env" {
  type = string 
  description = "Environment"
  default = "dev"
}

variable "region" {
  type = string 
  description = "Proivder region"
  default = "ue1"
}

variable "tier" {
  type = string 
  description = "Tier"
  default = "frontend"
}


