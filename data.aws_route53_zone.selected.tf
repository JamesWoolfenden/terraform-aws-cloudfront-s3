data "aws_route53_zone" "selected" {
  name         = var.zone
  private_zone = false
}
