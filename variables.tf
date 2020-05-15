variable "fqdn" {
  type        = string
  description = "A fully qualified domain name"
}

variable "domain" {
  type        = string
  description = "The domain name"
}

variable "force_destroy" {
  type    = bool
  default = true
}

variable "web_acl_name" {
  type        = string
  description = "Web acl name"
}

variable "common_tags" {
  type        = map
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
  type        = bool
  default     = true
  description = "Switch to control versioning"
}

variable "access_log_bucket" {
  type        = string
  default     = "access_log_record"
  description = "Name of your access logging bucket"
}
