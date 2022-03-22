# tfsec:ignore:AWS077
resource "aws_s3_bucket" "logging" {
  # checkov:skip=CKV_AWS_145: ADD REASON
  # checkov:skip=CKV_AWS_144: ADD REASON
  # checkov:skip=CKV_AWS_145: v4 legacy
  # checkov:skip=CKV_AWS_19: v4 legacy
  # checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  # checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  # checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  bucket = "${var.bucket_name}-logging"


  lifecycle {
    ignore_changes = [tags]
  }
}


resource "aws_s3_bucket_acl" "logging" {
  bucket = aws_s3_bucket.logging.bucket
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "logging" {
  bucket = aws_s3_bucket.logging.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = var.kms_key.id
    }
  }

}

resource "aws_s3_bucket_versioning" "logging" {
  bucket = aws_s3_bucket.logging.id
  versioning_configuration {
    status     = "Enabled"
    mfa_delete = "Disabled"
  }
}


resource "aws_s3_bucket_lifecycle_configuration" "logging" {
  bucket = aws_s3_bucket.logging.id

  rule {
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
    status = "Enabled"
    id     = "cleanout"

    expiration {
      days                         = 31
      expired_object_delete_marker = false
    }

    noncurrent_version_expiration {
      noncurrent_days = 31
    }

  }
}
