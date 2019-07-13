resource "aws_s3_bucket" "website" {
  bucket = var.fqdn
  acl    = "private"
}
