resource "aws_instance" "first_ec2" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t2.micro"
  tags = {
    Name        = "first"
    Environment = "dev"
  }
}


