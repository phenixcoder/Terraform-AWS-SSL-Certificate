# Certificate in Differnt AWS region

This is commonly used to create a certificate fof Cloudfront where you need a SSL cretificate in AWS region `us-east-1` only irrespective of where your main infrastrucre lives.

For this you need to pass the provider where the region is set to `us-east-1`

To create a for the same, add following code to your terraform config. You can have any `alias` as per your need.

```hcl
provider "aws" {
  alias  = "cdn"
  region = "us-east-1"
}
```

And pass this provider to module config.

```hcl
module "website_ssl_certificate" {
  source = "phenixcoder/ssl-certificate/aws"

  // Specify your region here
  providers = {
    aws = aws.cdn
  }

  // further configuration ...
}
```