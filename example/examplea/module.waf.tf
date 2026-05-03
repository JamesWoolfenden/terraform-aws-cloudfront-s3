module "waf2" {
  source = "git::https://github.com/JamesWoolfenden/terraform-aws-waf2.git?ref=e920ce75f007a95602cf7e8f957f86e174b7e4fb" #v0.1.3
  kms_key_arn = aws_kms_key.waf.arn
}

resource "aws_kms_key" "waf" {
  enable_key_rotation = true
}
