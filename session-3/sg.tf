resource "aws_security_group" "main" {
  name        = "aws-session-sg"
  description = "security group for ec2 isntance"

  tags = {
    Name = "aws-session-sg"
  }
}