resource "aws_security_group" "alb_sg" {
    name = "hw5-alb-sg"
    vpc_id = local.vpc_id
    tags = merge(
        var.tags, 
        {Name = "hw5-alb-sg"}
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
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.alb_sg.id
}



resource "aws_lb" "alb" {
    name = "hw5-app-alb"
    internal = false  #public

    subnets = local.public_subnet_id
    security_groups = [aws_security_group.alb_sg.id]

    tags = merge (
        var.tags, 
        { Name = "hw5-app-alb"}
    )
}



resource "aws_lb_target_group" "app_target_group" {
  name = "hw5-app-tg"
  port = 80 
  protocol = "HTTP"
  vpc_id = local.vpc_id

  health_check {
    path = "/" # get response from homepage 
  }
  tags = merge(
    var.tags, 
    {Name = "hw5-app-tg"}
  )

}

resource "aws_lb_listener" "http_80" {
    load_balancer_arn = aws_lb.alb.arn
    port = 80
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.app_target_group.arn
    }

}