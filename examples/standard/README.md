# Standard Certificate

This is the bare minimum config to create an ACM cretificate. It will be created in your config's AWS region.

```hcl
module "website_ssl_certificate" {
  source = "phenixcoder/ssl-certificate/aws"

  fqdn         = "example.com" // Your domain
  environment  = "production"
}
```