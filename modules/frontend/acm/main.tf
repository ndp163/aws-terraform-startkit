resource "aws_acm_certificate" "frontend" {
  provider          = aws.east
  domain_name       = var.frontend_domain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
