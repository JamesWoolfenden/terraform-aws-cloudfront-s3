output "distribution" {
  value = aws_cloudfront_distribution.website
}

output "identity" {
  value = aws_cloudfront_origin_access_identity.website
}

output "policy" {
  value = data.aws_iam_policy_document.cloudfront.json
}
