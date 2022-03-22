module "cloudfront" {
  source      = "../../"
  common_tags = var.common_tags
  providers = {
    aws.useastone = aws.useastone
  }
  bucket_name        = var.bucket_name
  header_policy_name = "examplea"
  fqdn               = var.fqdn
  zone               = var.zone
  kms_key            = aws_kms_key.example
  web_acl_id         = module.waf2.aws_wafv2_web_acl.id
}
