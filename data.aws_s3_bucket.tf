data "aws_s3_bucket" "website" {
  bucket = var.bucket_name
}

data "aws_s3_bucket" "logging" {
  bucket = "${var.bucket_name}-logging"
}
