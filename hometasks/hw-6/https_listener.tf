resource "aws_lb_listener" "https" { # add https using cert
  load_balancer_arn = local.alb_arn
  port = 443
  protocol = "HTTPS"

  certificate_arn = aws_acm_certificate_validation.cert_validation.certificate_arn 

  default_action {
    type = "forward"
    target_group_arn = local.tg_arn
  }



}

#https://hw.meder-cool-guy.com/