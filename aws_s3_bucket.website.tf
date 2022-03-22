# tfsec:ignore:AWS017
resource "aws_s3_bucket" "website" {
  # checkov:skip=CKV_AWS_18: v4 legacy
  # checkov:skip=CKV2_AWS_40: Its a website
  # checkov:skip=CKV2_AWS_6: ADD REASON
  # checkov:skip=CKV_AWS_144: Its a website
  # checkov:skip=CKV_AWS_145: Its a website
  # checkov:skip=CKV_AWS_19: "Ensure all data stored in the S3 bucket is securely encrypted at rest"
  # checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  # checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  bucket        = var.bucket_name
  force_destroy = var.force_destroy

  tags = var.common_tags
}

resource "aws_s3_bucket_acl" "website" {
  bucket = aws_s3_bucket.website.bucket
  acl    = "private"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

resource "aws_s3_bucket_logging" "website" {
  bucket = aws_s3_bucket.website.id

  target_bucket = aws_s3_bucket.logging.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_versioning" "website" {
  bucket = aws_s3_bucket.website.id
  versioning_configuration {
    status = var.versioning
  }
}


resource "aws_s3_bucket_cors_configuration" "website" {
  bucket = aws_s3_bucket.website.bucket

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

}
