output "domain_name" {
  value = aws_acm_certificate.media_cdn.domain_name
}

output "acm_arn" {
  value = aws_acm_certificate.media_cdn.arm
}
