resource "aws_cloudfront_distribution" "website" {
  origin {
    domain_name = aws_s3_bucket.website.bucket_regional_domain_name
    origin_id   = "${aws_s3_bucket.website.id}-origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.website.cloudfront_access_identity_path
    }
  }

  web_acl_id = var.web_acl_id

  enabled         = true
  is_ipv6_enabled = true

  default_root_object = "index.html"

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  /*aliases = [
    var.fqdn,
  ]*/

  logging_config {
    bucket          = aws_s3_bucket.logging.bucket_domain_name
    include_cookies = false
    prefix          = "cloudfront/"
  }

  default_cache_behavior {
    allowed_methods = [
      "GET",
      "HEAD",
    ]

    cached_methods = [
      "GET",
      "HEAD",
    ]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl     = var.min_ttl
    default_ttl = var.default_ttl
    max_ttl     = var.max_ttl

    target_origin_id       = "${aws_s3_bucket.website.id}-origin"
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = var.price_class

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"

      locations = var.locations
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = var.cloudfront_default_certificate
    acm_certificate_arn            = var.acm_certificate_arn
    #ssl_support_method             = "sni-only"
    minimum_protocol_version = "TLSv1"
  }
  tags = var.common_tags
}
