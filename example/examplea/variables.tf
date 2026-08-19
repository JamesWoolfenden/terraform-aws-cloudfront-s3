
variable "bucket_name" {
  type        = string
  description = "name of the bucket"

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "Value must be a valid S3 bucket name: 3-63 lowercase alphanumeric characters, dots or hyphens, starting and ending with a letter or number."
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
  description = "zone is not always the root of fqdn"

  validation {
    condition     = can(regex("^([a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?\\.)+$", var.zone))
    error_message = "Value must be a valid Route53 zone name, ending with a trailing dot (e.g. \"example.com.\")."
  }
}
