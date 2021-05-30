module "cloudfront" {
  source      = "../../"
  common_tags = var.common_tags
  providers = {
    aws.useastone = aws.useastone
  }
  bucket_name = var.bucket_name
  fqdn        = var.fqdn
  zone        = var.zone
}
