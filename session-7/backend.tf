terraform {
  backend "s3" {
    bucket  = "terraform-backend-bucket-3"
    key     = "session-7/dev/terraform.tfstate" # path to tfstate file 
    region  = "us-east-1"
    encrypt = true
  }
}