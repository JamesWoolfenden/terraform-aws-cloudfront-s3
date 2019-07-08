resource "aws_route53_record" "website" {
  zone_id = "${data.aws_route53_zone.main.zone_id}"
  name    = "${var.fqdn}"
  type    = "CNAME"

  records = [
    "${aws_cloudfront_distribution.website.domain_name}",
  ]

  ttl = "${var.ttl}"
}
