resource "aws_acm_certificate" "media_cdn" {
  provider          = aws.east
  domain_name       = var.media_cdn_domain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
