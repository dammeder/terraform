# output "private_subnet_id" {
#   value = local.private_subnet_id
# }

# output "public_subnet_id" {
#   value = local.public_subnet_id
# }

output "alb_dns" {
    value = aws_lb.alb.dns_name
}

output "alb_zone_id" {
  value = aws_lb.alb.zone_id 
}

output "alb_arn" { # get arn for https listener
  value = aws_lb.alb.arn
}

output "tg_arn" {   # arn from lb target group 
  value = aws_lb_target_group.app_target_group.arn 
}

output "vpc_id" {
  value = local.vpc_id
}


# Hello World from ip-10-0-4-222.ec2.internal