module "cloudfront" {
  source       = "../../"
  common_tags  = var.common_tags
  fqdn         = var.fqdn
  domain       = var.domain
  web_acl_name = var.web_acl_name
}
