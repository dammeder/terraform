resource "aws_instance" "first_ec2" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t2.micro"

  tags = {
    Name = "my-terraform-webserver"
  }

  user_data = <<EOF
#!/bin/bash 
dnf install httpd -y 
systemctl enable httpd
systemctl start httpd 
echo "<html><body><h1>Session-2 homework is complete! </h1></body></html>" > /var/www/html/index.html
EOF
}