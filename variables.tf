variable "force_destroy" {
  type    = bool
  default = true
}

variable "common_tags" {
  type        = map(any)
  description = "Implements the common tags scheme"
}

variable "ttl" {
  type    = string
  default = "300"
}

variable "bucket_acl" {
  type    = string
  default = "Private"
}

variable "versioning" {
  type        = string
  default     = "Enabled"
  description = "Switch to control versioning"
}

variable "access_log_bucket" {
  type        = string
  default     = "logging"
  description = "Name of your access logging bucket"
}

variable "acm_certificate_arn" {
  type        = string
  default     = ""
  description = "The ARN of the certificate to be used"
}

variable "locations" {
  description = "Locations for the Distribution"
  type        = list(any)
  default     = ["GB"]
}

variable "cloudfront_default_certificate" {
  description = "use default SSL certificate"
  type        = bool
  default     = false
}

variable "price_class" {
  type    = string
  default = "PriceClass_100"
}


variable "bucket_name" {
  type        = string
  description = "name of the bucket"
}


variable "min_ttl" {
  description = "min ttl values"
  type        = number
  default     = 30
}

variable "default_ttl" {
  description = "default ttl values"
  type        = number
  default     = 90
}

variable "max_ttl" {
  description = "max ttl values"
  type        = number
  default     = 300
}

variable "fqdn" {
  type        = string
  description = "The fully qualified domain Name"
}

variable "zone" {
  type        = string
  description = "The route53 zone to use"
}

variable "sse_algorithm" {
  type        = string
  description = "The type of encryption algorithm to use"
  default     = "aws:kms"
}

variable "restriction_type" {
  type    = string
  default = "whitelist"
  validation {
    condition     = can(regex("none|whitelist|blacklist", var.restriction_type))
    error_message = "Value must be none, whitelist or blacklist."
  }
}

variable "retain" {
  type        = bool
  description = "Do you want to retain the distribution on delete?"
  default     = false
}

variable "web_acl_id" {
  type        = string
  description = "The id of the WAF"
}

variable "header_policy_name" {
  type = string

}

variable "kms_key" {

}
