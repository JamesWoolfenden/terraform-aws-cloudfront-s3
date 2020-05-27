output "distribution" {
  value = aws_cloudfront_distribution.website
}

output "identity" {
  value = aws_cloudfront_origin_access_identity.website
}

output "bucket" {
  value = aws_s3_bucket.website
}

output "logging" {
  value = aws_s3_bucket.logging
}
