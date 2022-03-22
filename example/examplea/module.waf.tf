module "waf2" {
  source      = "JamesWoolfenden/waf2/aws"
  version     = "0.1.3"
  kms_key_arn = aws_kms_key.waf.arn
}

resource "aws_kms_key" "waf" {
  enable_key_rotation = true
}
