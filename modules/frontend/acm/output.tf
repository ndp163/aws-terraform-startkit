output "frontend_domain_name" {
  value = aws_acm_certificate.frontend.domain_name
}

output "frontend_acm_arn" {
  value = aws_acm_certificate.frontend.arm
}
