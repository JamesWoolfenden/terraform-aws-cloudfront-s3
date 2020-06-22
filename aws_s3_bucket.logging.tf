resource "aws_s3_bucket" "logging" {
  #checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  #checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  bucket = "${var.bucket_name}-logging"

  acl = "log-delivery-write"
  versioning {
    enabled    = false
    mfa_delete = false
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }

  lifecycle_rule {
    abort_incomplete_multipart_upload_days = 7
    enabled                                = true
    id                                     = "cleanout"

    expiration {
      days                         = 31
      expired_object_delete_marker = false
    }

    noncurrent_version_expiration {
      days = 31
    }

  }

  tags = var.common_tags
}
