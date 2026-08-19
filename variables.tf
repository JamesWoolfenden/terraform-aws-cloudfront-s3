variable "force_destroy" {
  type        = bool
  default     = true
  description = "Whether to allow the S3 buckets to be destroyed even when they contain objects"
}

variable "versioning" {
  type        = string
  default     = "Enabled"
  description = "Switch to control versioning"

  validation {
    condition     = contains(["Enabled", "Suspended", "Disabled"], var.versioning)
    error_message = "Value must be Enabled, Suspended or Disabled."
  }
}

variable "locations" {
  description = "Locations for the Distribution"
  type        = list(any)
  default     = ["GB"]

  validation {
    condition     = alltrue([for location in var.locations : can(regex("^[A-Z]{2}$", location))])
    error_message = "Each location must be a 2-letter uppercase ISO 3166-1 alpha-2 country code."
  }
}

variable "cloudfront_default_certificate" {
  description = "use default SSL certificate"
  type        = bool
  default     = false
}
variable "price_class" {
  type        = string
  default     = "PriceClass_100"
  description = "CloudFront price class controlling which edge locations serve the distribution"

  validation {
    condition     = contains(["PriceClass_100", "PriceClass_200", "PriceClass_All"], var.price_class)
    error_message = "Value must be PriceClass_100, PriceClass_200 or PriceClass_All."
  }
}

variable "bucket_name" {
  type        = string
  description = "name of the bucket"

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "Value must be a valid S3 bucket name: 3-63 lowercase alphanumeric characters, dots or hyphens, starting and ending with a letter or number."
  }
}
variable "min_ttl" {
  description = "min ttl values"
  type        = number
  default     = 30

  validation {
    condition     = var.min_ttl >= 0 && var.min_ttl <= var.default_ttl
    error_message = "min_ttl must be >= 0 and <= default_ttl."
  }
}
variable "default_ttl" {
  description = "default ttl values"
  type        = number
  default     = 90

  validation {
    condition     = var.default_ttl >= 0 && var.default_ttl <= var.max_ttl
    error_message = "default_ttl must be >= 0 and <= max_ttl."
  }
}
variable "max_ttl" {
  description = "max ttl values"
  type        = number
  default     = 300

  validation {
    condition     = var.max_ttl >= 0
    error_message = "max_ttl must be >= 0."
  }
}
variable "fqdn" {
  type        = string
  description = "The fully qualified domain Name"

  validation {
    condition     = can(regex("^([a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?\\.)+[a-z]{2,}$", var.fqdn))
    error_message = "Value must be a valid fully qualified domain name, without a trailing dot."
  }
}
variable "zone" {
  type        = string
  description = "The route53 zone to use"

  validation {
    condition     = can(regex("^([a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?\\.)+$", var.zone))
    error_message = "Value must be a valid Route53 zone name, ending with a trailing dot (e.g. \"example.com.\")."
  }
}
variable "sse_algorithm" {
  type        = string
  description = "The type of encryption algorithm to use"
  default     = "aws:kms"

  validation {
    condition     = contains(["AES256", "aws:kms"], var.sse_algorithm)
    error_message = "Value must be AES256 or aws:kms."
  }
}
variable "restriction_type" {
  type        = string
  default     = "whitelist"
  description = "The CloudFront geo-restriction type to apply to locations"
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

  validation {
    condition     = var.web_acl_id == "" || can(regex("^arn:aws:wafv2:", var.web_acl_id))
    error_message = "Value must be empty or a WAFv2 web ACL ARN (arn:aws:wafv2:...)."
  }
}
variable "header_policy_name" {
  type        = string
  description = "Name of the CloudFront response headers policy"

  validation {
    condition     = length(var.header_policy_name) > 0 && length(var.header_policy_name) <= 128
    error_message = "Value must be between 1 and 128 characters."
  }
}
variable "kms_key" {
  type        = object({ id = string })
  description = "The KMS key used to encrypt the website bucket"
  sensitive   = true

  validation {
    condition     = length(var.kms_key.id) > 0
    error_message = "kms_key.id must not be empty."
  }
}
