provider "aws" {
  alias  = "cdn"
  region = "us-east-1"
}

module "website_ssl_certificate" {
  source = "phenixcoder/ssl-certificate/aws"
  providers = {
    aws = aws.cdn
  }

  hosting_zone_domain_name = "example.com"
  fqdn                     = "microservice.example.com"
  environment              = "production"

  additional_domains = [
    "users.microservice.example.com",
    "product.microservice.example.com",
    "orders.microservice.example.com",
  ]
}