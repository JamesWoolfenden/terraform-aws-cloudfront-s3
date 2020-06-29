output "distribution" {
  value = module.cloudfront.distribution
}

output "identity" {
  value = module.cloudfront.identity
}

output "policy" {
  value = module.cloudfront.policy
}

output "website" {
  value = module.cloudfront.website
}

output "logging" {
  value = module.cloudfront.logging
}
