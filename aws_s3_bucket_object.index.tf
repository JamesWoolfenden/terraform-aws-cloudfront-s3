resource "aws_s3_bucket_object" "index" {
  bucket       = var.bucket_name
  key          = "index.html"
  source       = "${path.module}/files/index.html"
  content_type = "text/html"
  lifecycle {
    ignore_changes = all
  }
}
