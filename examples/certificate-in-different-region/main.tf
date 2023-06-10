provider "aws" {
  alias  = "cdn"
  region = "us-east-1"
}

module "main_website_ssl_certificate" {
  source = "phenixcoder/ssl-certificate/aws"

  // Specify your region here
  providers = {
    aws = aws.cdn
  }

  fqdn        = "example.com"
  environment = "production"
}