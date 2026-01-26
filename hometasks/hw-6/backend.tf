terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket-hw"
    key = "hometasks/hw-6/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}