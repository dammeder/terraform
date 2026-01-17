data "terraform_remote_state" "hw3_vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-backend-bucket-hw"
    key = "hometasks/hw-3/terraform.tfstate"
    region = "us-east-1"
  }
}


locals { 
    vpc_id = data.terraform_remote_state.hw3_vpc.outputs.vpc_id
    public_subnet_id = data.terraform_remote_state.hw3_vpc.outputs.public_subnet_id
    private_subnet_id = data.terraform_remote_state.hw3_vpc.outputs.private_subnet_id
}