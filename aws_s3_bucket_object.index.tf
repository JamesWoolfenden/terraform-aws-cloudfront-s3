resource "aws_s3_bucket_object" "index" {
  #checkov:skip=CKV_AWS_186:public
  bucket       = aws_s3_bucket.website.id
  key          = "index.html"
  source       = "${path.module}/files/index.html"
  content_type = "text/html"
  lifecycle {
    ignore_changes = all
  }
}
