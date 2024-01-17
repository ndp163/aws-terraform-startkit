resource "tls_private_key" "cloudfront" {
  algorithm = "RSA"
}

resource "local_sensitive_file" "cloudfront" {
  filename        = "${path.module}/${terraform.workspace}-${var.project}-cf-key.pem"
  content         = tls_private_key.cloudfront.private_key_pem
  file_permission = "0400"
}

# data "local_file" "cloud_front_public_key" {
#   filename = "${path.module}/${terraform.workspace}-${var.project}-cloudfront-key.pem"
# }

resource "aws_cloudfront_public_key" "media_cdn" {
  name        = "${terraform.workspace}-${var.project}-media-cdn"
  comment     = "${terraform.workspace}-${var.project}-media-cdn-public-key"
  encoded_key = tls_private_key.cloudfront.public_key_pem
}

resource "aws_cloudfront_key_group" "cf_keygroup" {
  items = [aws_cloudfront_public_key.media_cdn.id]
  name  = "${terraform.workspace}-${var.project}-media-cdn"
}
