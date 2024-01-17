resource "aws_s3_bucket" "media_cdn" {
  bucket = "${terraform.workspace}-${var.project}-media-cdn"
}

resource "aws_s3_bucket_ownership_controls" "media_cdn" {
  bucket = aws_s3_bucket.media_cdn.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "media_cdn_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.media_cdn]

  bucket = aws_s3_bucket.media_cdn.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "media_cdn" {
  bucket = aws_s3_bucket.media_cdn.id

  rule {
    bucket_key_enabled = false

    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "media_cdn" {
  bucket = aws_s3_bucket.media_cdn.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_cors_configuration" "media_cdn" {
  bucket = aws_s3_bucket.media_cdn.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST", "HEAD"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket_policy" "media_cdn" {
  bucket = aws_s3_bucket.media_cdn.id
  policy = data.aws_iam_policy_document.media_cdn_policy.json
}
