output "domain_name" {
  value = aws_acm_certificate.this.domain_name
}

output "acm_arn" {
  value = aws_acm_certificate.this.arm
}
