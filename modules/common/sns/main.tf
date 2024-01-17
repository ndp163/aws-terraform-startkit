resource "aws_sns_topic" "notification_mails" {
  count = terraform.workspace == "pro" ? 1 : 0
  name  = "${terraform.workspace}-${var.project}-notification-mails"
}

resource "aws_sns_topic_subscription" "sunbscription_mails" {
  count = terraform.workspace == "pro" ? length(var.subscription_mails) : 0

  topic_arn = aws_sns_topic.notification_mails[0].arn
  protocol  = "email"
  endpoint  = var.subscription_mails[count.index]
}
