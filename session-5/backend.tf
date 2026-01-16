terraform {
  backend "s3" {
    bucket  = "terraform-backend-bucket-3"
    key     = "session-5/terraform.tfstate" 
    region  = "us-east-1"
    encrypt = true
  }
}