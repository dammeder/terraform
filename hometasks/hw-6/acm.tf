#create tls certificate for https


data "aws_route53_zone" "zone" {    # find zone for domain 
  name = var.domain_name
  private_zone = false
}

resource "aws_acm_certificate" "cert" { #request cert for hw.meder-cool-guy.com
  domain_name = local.domain
  validation_method = "DNS"

}

resource "aws_route53_record" "cert_validation" {
  for_each = { #auto create record
    for dvo in aws_acm_certificate.cert.domain_validation_options :
    dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }
  zone_id = data.aws_route53_zone.zone.zone_id
  name = each.value.name
  type = each.value.type 
  ttl = 300 # time to live
  records = [each.value.record]
}

resource "aws_acm_certificate_validation" "cert_validation" { 
  certificate_arn = aws_acm_certificate.cert.arn 
  validation_record_fqdns = [for r in aws_route53_record.cert_validation : r.fqdn ]
}