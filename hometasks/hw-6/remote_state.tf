data "terraform_remote_state" "hw5" {
  backend = "s3"
  config = {
    bucket = "terraform-backend-bucket-hw"
    key = "hometasks/hw-5/terraform.tfstate"
    region = var.region
  }
}


locals {
  alb_dns_name = data.terraform_remote_state.hw5.outputs.alb_dns 
  alb_zone_id = data.terraform_remote_state.hw5.outputs.alb_zone_id
  alb_arn = data.terraform_remote_state.hw5.outputs.alb_arn
  tg_arn = data.terraform_remote_state.hw5.outputs.tg_arn
  
  domain = "${var.sub_domain}.${var.domain_name}"
  
}

# output "alb_dns_name" {
#   value = local.alb_dns_name
# }

