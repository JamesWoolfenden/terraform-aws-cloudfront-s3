data "aws_route53_zone" "selected" {
  name         = local.zone
  private_zone = false
}
