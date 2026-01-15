resource "aws_security_group" "main" {
  name        = "aws-session-sg"
  description = "security group for ec2 isntance"

  tags = merge(
    var.tags, 
    {"Name" = "${var.env}-security-group"}
  )
}

resource "aws_security_group_rule" "main" {
  count = 5
  type              = "ingress"
  from_port         = element(var.ports, count.index)
  to_port           = element(var.ports, count.index)
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}


resource "aws_security_group_rule" "main_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" #tcp, udp , icmp ====  -1 ALL protocols 
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}

#element(["22", "80", "443", "3306", "5432"], 1)