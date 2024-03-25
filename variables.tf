


variable "hosting_zone" {
  type        = string
  description = "Zone ID for Route53 hosting zone"
}

variable "fqdn" {
  type        = string
  description = "Primary domain for certificate"
}

variable "additional_domains" {
  type        = list(string)
  description = "Additional domains/sub-domains to be added to this certificate"
  default     = []

}
variable "environment" {
  type        = string
  description = "Certificate Environment Tag"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the ACM certificate"
}