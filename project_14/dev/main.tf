module "sg" {
    # CALL MODULE 
  source = "../../modules/sg"
    # SPECIFY MODULE VERSION 

  #version = "3.3.0"

  # PASS VALUES TO VAR

  name = "dev-sg"
  description = "This is a Dev SG "

}

module "ec2" {
  source = "../../modules/ec2"

  env = "dev"
  ami = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  vpc_security_group_ids = [module.sg.security_group_id]
  
}

# CALLING CHILD MODULE FROM REGISTRY

module "s3-bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "5.10.0"
  bucket = "terraform-backend-bucket-3"

}

# CALLING CHILD MODULE FROM GITHUB
module "web-sg" {
  source = "github.com/dammeder/terraform//modules/sg"

  name = "web-sg"
  
}

# TERRAFORM ALWAYS LOOKS INTO DEFAULT BRANCH (main)

