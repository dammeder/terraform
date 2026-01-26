resource "aws_route53_record" "alias" { #point domain to alb 
  zone_id = data.aws_route53_zone.zone.zone_id
  name = local.domain
  type = "A"

  alias {
    name = local.alb_dns_name
    zone_id = local.alb_zone_id
    evaluate_target_health = true #check alb health 
  }
}