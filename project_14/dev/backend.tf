terraform {
  backend "s3" {
    bucket  = "terraform-backend-bucket-3"
    key     = "project_14/dev/terraform.tfstate" # path to tfstate file 
    region  = "us-east-1"
    encrypt = true
  }
}