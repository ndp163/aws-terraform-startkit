output "media_cdn_domain_name" {
  value = aws_acm_certificate.media_cdn.domain_name
}

output "media_cdn_acm_arn" {
  value = aws_acm_certificate.media_cdn.arm
}
