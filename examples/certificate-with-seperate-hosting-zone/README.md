# Certificate with seperate Hosting Zone

This is a scenario where the FQDN is a subdomain. The root domain for Route53 Hosting Zone is difined expicitly to do the DNS validation.

This
```hcl
module "website_ssl_certificate" {
  source = "phenixcoder/ssl-certificate/aws"

  hosting_zone_domain_name         = "api.example.com"
  fqdn         = "api.example.com"
  environment  = "production"
}
```