resource "aws_acm_certificate" "backend" {
  provider          = aws.east
  domain_name       = var.backend_domain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
