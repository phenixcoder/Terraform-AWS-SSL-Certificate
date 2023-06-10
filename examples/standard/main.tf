module "website_ssl_certificate" {
  source = "phenixcoder/ssl-certificate/aws"

  fqdn        = "example.com"
  environment = "production"
}