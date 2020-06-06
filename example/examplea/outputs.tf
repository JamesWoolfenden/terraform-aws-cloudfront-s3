output "distribution" {
  value = module.cloudfront.distribution
}

output "identity" {
  value = module.cloudfront.identity
}

output "bucket" {
  value = module.cloudfront.bucket
}

output "logging" {
  value = module.cloudfront.logging
}
