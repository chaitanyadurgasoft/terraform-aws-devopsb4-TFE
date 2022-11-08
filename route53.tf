data "aws_route53_zone" "cgit" {
  name         = "cgitedu.com."
  private_zone = false
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.cgit.zone_id
  name    = "prod.cgitedu.com"
  type    = "A"
  alias {
    name                   = module.prod_elb.elb_dns_name
    zone_id                = module.prod_elb.elb_zone_id
    evaluate_target_health = true
  }
}
resource "aws_acm_certificate" "cert" {
  domain_name       = "cgitedu.com"
  validation_method = "DNS"
}
resource "aws_route53_record" "cert_validation_record" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.cgit.zone_id
}
resource "aws_acm_certificate_validation" "validation" {
  timeouts {
    create = "5m"
  }
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation_record : record.fqdn]
}