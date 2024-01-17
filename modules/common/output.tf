output "vpc_config" {
  value = module.vpc.config
}

output "s3_log_bucket_domain_name" {
  value = module.s3.log_bucket_domain_name
}

output "sns_notification_topic_arn" {
  value = module.sns.sns_topic_arn
}
