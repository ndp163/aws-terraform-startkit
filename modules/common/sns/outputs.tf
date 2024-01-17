output "sns_topic_arn" {
  value = terraform.workspace == "pro" ? aws_sns_topic.notification_mails[0].arn : ""
}
