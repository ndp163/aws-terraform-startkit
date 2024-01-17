output "cloudfront_oai_arn" {
  value = aws_cloudfront_origin_access_identity.media_cdn.iam_arn
}
