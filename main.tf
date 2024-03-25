terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}

resource "aws_acm_certificate" "certificate" {
  domain_name               = var.fqdn
  subject_alternative_names = var.additional_domains
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    {
      Name = var.fqdn
      Environment : var.environment
    },
    var.tags,
  )
}

resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in aws_acm_certificate.certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  name            = each.value.name
  type            = each.value.type
  zone_id         = var.hosting_zone
  records         = [each.value.record]
  ttl             = 60
  allow_overwrite = true
}

resource "aws_acm_certificate_validation" "ssl_certificate" {

  certificate_arn = aws_acm_certificate.certificate.arn

  validation_record_fqdns = [for record in aws_route53_record.validation : record.fqdn]
}