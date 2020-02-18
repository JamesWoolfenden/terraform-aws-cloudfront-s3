variable "common_tags" {
  type = map
}

variable "fqdn" {
  type = string
}

variable "domain" {
  type        = string
  description = "The domain name"
}

variable "web_acl_name" {
  type        = string
  description = "Web acl name"
}
