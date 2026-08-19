output "distribution" {
  description = "The CloudFront distribution serving the website"
  value       = aws_cloudfront_distribution.website
}

output "identity" {
  description = "The CloudFront origin access identity used to access the website bucket"
  value       = aws_cloudfront_origin_access_identity.website
}

output "policy" {
  description = "The IAM policy document JSON granting CloudFront access to the website bucket"
  value       = data.aws_iam_policy_document.cloudfront.json
}

output "website" {
  description = "The S3 bucket serving as the CloudFront origin for the website"
  value       = aws_s3_bucket.website
}

output "logging" {
  description = "The S3 bucket receiving access logs for the website bucket"
  value       = aws_s3_bucket.logging
}
