resource "aws_s3_bucket" "backend_pipeline" {
  bucket        = "${terraform.workspace}-${var.project}-backend-pipeline"
  force_destroy = false
}

resource "aws_s3_bucket_ownership_controls" "backend_pipeline" {
  bucket = aws_s3_bucket.backend_pipeline.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "backend_pipeline" {
  depends_on = [aws_s3_bucket_ownership_controls.backend_pipeline]
  bucket     = aws_s3_bucket.backend_pipeline.id
  acl        = "private"
}

resource "aws_s3_bucket_public_access_block" "backend_pipeline" {
  bucket = aws_s3_bucket.backend_pipeline.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "backend_pipeline" {
  bucket = aws_s3_bucket.backend_pipeline.id

  rule {
    id     = "${terraform.workspace}-${var.project}-expiration-rule"
    status = "Enabled"

    expiration {
      days = 90 # 3 months
    }
  }
}
