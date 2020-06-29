resource "aws_s3_bucket" "website" {
  #checkov:skip=CKV_AWS_19: "Ensure all data stored in the S3 bucket is securely encrypted at rest"
  #checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  #checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  bucket        = var.bucket_name
  acl           = "private"
  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning
  }

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  cors_rule {
    allowed_headers = [
      "Authorization",
    ]
    allowed_methods = [
      "GET",
    ]
    allowed_origins = [
      "*",
    ]
    expose_headers  = []
    max_age_seconds = 3000
  }

  logging {
    target_bucket = aws_s3_bucket.logging.id
  }

  tags = var.common_tags
}
