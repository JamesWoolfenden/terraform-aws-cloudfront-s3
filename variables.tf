variable "fqdn" {
  type        = "string"
  description = "A fully qualified domain name (eg. ostl.dev.fibrenation.net)"
}

variable "domain" {
  type        = "string"
  description = "The domain name"
}

variable "web_acl_name" {
  type        = "string"
  description = "Web acl name"
}

variable "common_tags" {
  type        = "map"
  description = "Implements the common tags scheme"
}

variable "ttl" {
  type    = "string"
  default = "300"
}
