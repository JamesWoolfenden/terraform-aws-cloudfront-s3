module "cloudfront" {
  source = "../../"
  providers = {
    aws.useastone = aws.useastone
  }
  bucket_name        = var.bucket_name
  header_policy_name = "examplea"
  fqdn               = var.fqdn
  zone               = var.zone
  kms_key            = aws_kms_key.site
  web_acl_id         = module.waf2.aws_wafv2_web_acl.id
}
