resource "aws_key_pair" "main" {
  key_name   = "MyMacLocalKey"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "main" {
  name        = "terraform-session-8-sg"
  description = "Security group for ec2"

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "first_ec2" {
  ami                    = "ami-07ff62358b87c7116"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.main.id
  vpc_security_group_ids = [aws_security_group.main.id]
  depends_on             = [aws_security_group.main]

  provisioner "file" {
    source      = "./index.html"    # path to file in local machine
    destination = "/tmp/index.html" # where to send file to   
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip # public ip of instance
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip # public ip of instance
      private_key = file("~/.ssh/id_rsa")
    }
  }

}

resource "aws_s3_bucket" "main" {
  bucket = "terraform-backend-bucket-3-meder"
}

resource "null_resource" "name" {
  provisioner "local-exec" {
    command = "aws s3 cp ./local-exec.txt s3://${aws_s3_bucket.main.bucket}"
  }
}