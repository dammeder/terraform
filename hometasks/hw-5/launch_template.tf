resource "aws_security_group" "app_sg" {
  name = "hw5-app-sg"
  vpc_id = local.vpc_id 
  tags = merge(
    var.tags, 
    {Name = "hw5-app-sg"}
  )
}

resource "aws_security_group_rule" "app_ingress_80_from_alb" {
  type = "ingress"
  security_group_id = aws_security_group.app_sg.id
  from_port = 80
  to_port = 80
  protocol = "tcp"
  source_security_group_id = aws_security_group.alb_sg.id 
}

resource "aws_security_group_rule" "app_egress" {
  type = "egress"
  security_group_id = aws_security_group.app_sg.id
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]

}


locals {
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
EOF
}

resource "aws_launch_template" "app_launch_template" {
  image_id = data.aws_ami.amazon_linux_2023.id
  instance_type = var.instance_type
  
  
  network_interfaces {
    associate_public_ip_address = false 
    security_groups = [aws_security_group.app_sg.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.tags, 
      {Name = "hw5-instance"}
    )
  }

  user_data = base64encode(local.user_data)


}
