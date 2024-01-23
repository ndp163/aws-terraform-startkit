output "cloudfront_oai_arn" {
  value = aws_cloudfront_origin_access_identity.media_cdn.iam_arn
}

output "public_key_id" {
  value = aws_cloudfront_public_key.media_cdn.id
}

output "key_path" {
  value = local.key_path
}
