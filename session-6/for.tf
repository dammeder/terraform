resource "aws_sqs_queue" "main" {
  for_each = toset(var.names)
  name     = each.key
}


variable "names" {
  type        = list(string)
  description = "This variable is sqs queue names"
  default     = ["queue-1", "queue-2", "queue-3"]
}


resource "aws_sqs_queue" "new" {
  for_each = toset(local.names)
  name     = each.key
}


locals {
  names = [for i in range(1, 3) : "new-queue-${i}"]
}

resource "aws_security_group" "main_sg" {
  name        = "main_sg"
  description = "secruity group "
}

resource "aws_security_group_rule" "sgr_ingress" {
  for_each          = local.service_values
  type              = "ingress"
  from_port         = each.value.port
  to_port           = each.value.port
  protocol          = "tcp"
  cidr_blocks       = [each.value.cidr_blocks]
  security_group_id = aws_security_group.main_sg.id
}

variable "services" {
  default = [
    { name = "ssh", port = 22, cidr_blocks = "10.0.0.0/16" },
    { name = "web", port = 80, cidr_blocks = "0.0.0.0/0" }
  ]
}


locals {
  service_values = {
    for svc in var.services : svc.name => { port = svc.port, cidr_blocks = svc.cidr_blocks }
  }
}





# locals {
#   service_ports = { 
#     for svc in var.services : svc.name => svc.port
#   }
#   service_cidr = { 
#     for svc in var.services : svc.name => svc.cidr_blocks
#   }

# }



output "service_value" {
  value = local.service_values
}