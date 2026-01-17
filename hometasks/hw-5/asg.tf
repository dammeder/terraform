# min = 1, max = 3, desired = 2
# attach ASG to the load balancer's target group
# vpc_zone_identifier: private subnets
# associate with launch template


resource "aws_autoscaling_group" "app_asg" {
    name = "hw5-app-asg"
    min_size = 1
    max_size = 3
    desired_capacity = 2 

    vpc_zone_identifier = local.private_subnet_id

    target_group_arns = [aws_lb_target_group.app_target_group.arn]


    launch_template {
      id = aws_launch_template.app_launch_template.id 
      version = "$Latest"

    }
    
    tag { 
        key = "Name"
        value = "hw5-app"
        propagate_at_launch = true 
    }

    dynamic "tag" { #comine common tags to isntance 
      for_each = var.tags 
      content {
        key = tag.key 
        value = tag.value 
        propagate_at_launch = true
      }
    }
}