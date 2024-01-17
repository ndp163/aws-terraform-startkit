output "frontend_pipeline_bucket" {
  value = aws_s3_bucket.frontend_pipeline.bucket
}

output "frontend_domain_name" {
  value = aws_s3_bucket.frontend.bucket_regional_domain_name
}
