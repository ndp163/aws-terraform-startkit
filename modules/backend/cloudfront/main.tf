resource "aws_cloudfront_distribution" "this" {
  web_acl_id      = var.waf_arn
  enabled         = true
  is_ipv6_enabled = true
  aliases         = var.custom_domain_name != null ? [var.custom_domain_name] : null
  price_class     = "PriceClass_All"

  origin {
    domain_name = var.alb_domain
    origin_id   = local.origin_id

    custom_header {
      name  = "X-Alb-Key"
      value = var.x_alb_key
    }

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1"]
    }
  }

  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = local.origin_id
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0

    forwarded_values {
      query_string = true
      headers      = ["Accept", "Referer", "Authorization", "Content-Type"]

      cookies {
        forward = "all"
      }
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = var.acm_arn != null ? false : true
    acm_certificate_arn            = var.acm_arn
    minimum_protocol_version       = var.acm_arn != null ? "TLSv1.2_2021" : null
    ssl_support_method             = var.acm_arn != null ? "sni-only" : null
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  logging_config {
    bucket          = var.log_bucket_domain_name
    include_cookies = true
    prefix          = "backend"
  }
}

// test
