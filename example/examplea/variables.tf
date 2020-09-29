variable "common_tags" {
  type = map
}


variable "bucket_name" {
  type        = string
  description = "name of the bucket"
}

variable "fqdn" {
  type        = string
  description = "The fully qualified domain Name"
}

variable "zone" {
  type        = string
  description = "zone is not always the root of fqdn"
}
