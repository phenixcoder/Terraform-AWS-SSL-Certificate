module "main_website_ssl_certificate" {
  source = "phenixcoder/ssl-certificate/aws"

  hosting_zone_domain_name = "example.com"
  fqdn                     = "api.example.com"
  environment              = "production"
}