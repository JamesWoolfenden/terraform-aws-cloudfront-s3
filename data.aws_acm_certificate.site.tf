data "aws_acm_certificate" "website" {
  domain = var.domain

  statuses = [
    "ISSUED",
  ]
}
