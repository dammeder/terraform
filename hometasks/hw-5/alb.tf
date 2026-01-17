resource "aws_security_group" "alb_sg" {
    name = "hw5-alb-sg"
    vpc_id = local.vpc_id
    tags = merge(
        var.tags, 
        {Name = "alb-sg"}
    )
}

resource "aws_security_group_rule" "alb_ingress" {
    count = length(var.ports)
    type = "ingress"
    from_port = var.ports[count.index] # 80 , 443
    to_port = var.ports[count.index]
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "alb_egress_all" {
    type = "egress"
    from_port = 0 
    to_port = 0 
    protocol = "-1"
    security_group_id = aws_security_group.alb_sg.id
}



resource "aws_lb" "alb" {
    name = "hw5-app-alb"
    internal = false  #public
    subnets = local.public_subnet_id
    security_groups = [aws_security_group.alb_sg]

    tags = merge (
        var.tags, 
        { Name = "app-alb"}
    )
}



resource "aws_lb_target_group" "alb_target_group" {
  
}