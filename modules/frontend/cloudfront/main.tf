resource "aws_cloudfront_origin_access_identity" "frontend" {
  comment = "${terraform.workspace}-${var.project}-s3-frontend-oai"
}

resource "aws_cloudfront_distribution" "frontend" {
  enabled             = true
  is_ipv6_enabled     = true
  aliases             = var.custom_domain_name != null ? [var.custom_domain_name] : null
  price_class         = "PriceClass_All"
  default_root_object = "index.html"

  origin {
    domain_name = var.origin_domain_name
    origin_id   = local.origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.frontend.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = local.origin_id
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.viewer_request.arn
    }
  }

  custom_error_response {
    error_caching_min_ttl = 86400
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
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
    include_cookies = false
    prefix          = "frontend"
  }
}
