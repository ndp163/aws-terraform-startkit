output "cloudfront_oai_arn" {
  value = aws_cloudfront_origin_access_identity.frontend.iam_arn
}
