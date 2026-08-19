output "distribution" {
  description = "The CloudFront distribution serving the website"
  value       = module.cloudfront.distribution
}

output "identity" {
  description = "The CloudFront origin access identity used to access the website bucket"
  value       = module.cloudfront.identity
}

output "policy" {
  description = "The IAM policy document JSON granting CloudFront access to the website bucket"
  value       = module.cloudfront.policy
}

output "website" {
  description = "The S3 bucket serving as the CloudFront origin for the website"
  value       = module.cloudfront.website
}

output "logging" {
  description = "The S3 bucket receiving access logs for the website bucket"
  value       = module.cloudfront.logging
}
