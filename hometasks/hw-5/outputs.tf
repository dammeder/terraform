# output "private_subnet_id" {
#   value = local.private_subnet_id
# }

# output "public_subnet_id" {
#   value = local.public_subnet_id
# }

output "alb_dns" {
    value = aws_lb.alb.dns_name
}


# Hello World from ip-10-0-4-222.ec2.internal