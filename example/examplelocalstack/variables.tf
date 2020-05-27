variable "common_tags" {
  type = map
}

variable "fqdn" {
  type = string
}

variable "bucket_name" {
  type        = string
  description = "name of the bucket"
}
