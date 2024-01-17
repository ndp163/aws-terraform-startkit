data "aws_iam_policy_document" "media_cdn_policy" {
  statement {
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.media_cdn.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [var.cloudfront_media_cdn_oai_arn]
    }
  }
}
