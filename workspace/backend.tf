terraform {
  backend "s3" {
    bucket  = "terraform-backend-bucket-3"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    workspace_key_prefix = "project-14"
  }
}

# workspace-prefix/workspace-name/key 

