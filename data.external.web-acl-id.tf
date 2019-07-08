data "external" "web-acl-id" {
  program = ["aws", "waf", "list-web-acls", "--query", "WebACLs[?Name==`${var.web_acl_name}`] | @[0]"]
}
