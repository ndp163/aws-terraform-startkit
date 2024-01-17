resource "aws_cloudwatch_metric_alarm" "lambda_concurrency_high" {
  count = terraform.workspace == "pro" ? 1 : 0

  alarm_name          = "${terraform.workspace}-${var.project}-lambda-concurrency-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "ConcurrentExecutions"
  namespace           = "AWS/Lambda"
  period              = "60"
  statistic           = "Maximum"
  threshold           = var.lambda_concurrency_threshold

  alarm_actions = [var.sns_topic_arn]
}
