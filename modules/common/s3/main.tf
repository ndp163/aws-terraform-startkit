resource "aws_s3_bucket" "access_log" {
  bucket = "${terraform.workspace}-${var.project}-cloudfront-log"
}

resource "aws_s3_bucket_ownership_controls" "access_log" {
  bucket = aws_s3_bucket.access_log.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "access_log" {
  bucket = aws_s3_bucket.access_log.id
  acl    = "private"

  depends_on = [aws_s3_bucket_ownership_controls.access_log]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "access_log" {
  bucket = aws_s3_bucket.access_log.id

  rule {
    bucket_key_enabled = false

    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "access_log" {
  bucket                  = aws_s3_bucket.access_log.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "access_log" {
  bucket = aws_s3_bucket.access_log.id

  rule {
    id     = "${terraform.workspace}-${var.project}-expiration-rule"
    status = "Enabled"

    expiration {
      days = 90 # 3 months
    }
  }
}
