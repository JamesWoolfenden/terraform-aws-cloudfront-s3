resource "aws_s3_bucket" "logging" {
  #checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  #checkov:skip=CKV_AWS_19: "Ensure all data stored in the S3 bucket is securely encrypted at rest"
  #checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  #checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  #bucket        = var.fqdn
  bucket        = "${var.bucket_name}-${var.access_log_bucket}"
  acl           = "log-delivery-write"
  force_destroy = var.force_destroy

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
