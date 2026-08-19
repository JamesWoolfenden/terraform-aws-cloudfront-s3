module "waf2" {
  source      = "git::https://github.com/JamesWoolfenden/terraform-aws-waf2.git?ref=718f0aa1a0657a021ea96d224f938995fe85be02" #v0.1.17
  kms_key_arn = aws_kms_key.waf.arn
}

resource "aws_kms_key" "waf" {
  enable_key_rotation     = true
  deletion_window_in_days = 7
}
