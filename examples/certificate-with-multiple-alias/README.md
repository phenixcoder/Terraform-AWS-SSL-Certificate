# Certificate with mutliple alias

This is commonly used to create a certificate with additional domains than the FQDN.

```hcl
module "website_ssl_certificate" {
  source = "phenixcoder/ssl-certificate/aws"

  fqdn         = "example.com"

  additional_domains = [
    "users.microservice.example.com",
    "product.microservice.example.com",
    "orders.microservice.example.com",
  ]

  // further configuration ...
}
```