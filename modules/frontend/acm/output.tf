output "domain_name" {
  value = aws_acm_certificate.frontend.domain_name
}

output "acm_arn" {
  value = aws_acm_certificate.frontend.arm
}
