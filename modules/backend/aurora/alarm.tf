resource "aws_cloudwatch_metric_alarm" "rds_cpu_high" {
  count               = terraform.workspace == "pro" ? 1 : 0
  alarm_name          = "${terraform.workspace}-${var.project}-rds-cpu-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = var.cpu_to_alarm
  alarm_actions       = [var.sns_topic_arn]

  dimensions = {
    DBClusterIdentifier = aws_rds_cluster.mysql.cluster_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_freeable_memory_low" {
  count               = terraform.workspace == "pro" ? 1 : 0
  alarm_name          = "${terraform.workspace}-${var.project}-rds-freeable-memory-low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Average"
  threshold           = tostring(var.memory * var.memory_to_alarm / 100)
  alarm_actions       = [var.sns_topic_arn]
  alarm_description   = "This metric checks for low freeable memory"

  dimensions = {
    DBClusterIdentifier = aws_rds_cluster.mysql.cluster_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_high_connections" {
  count               = terraform.workspace == "pro" ? 1 : 0
  alarm_name          = "${terraform.workspace}-${var.project}-rds-high-connections"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = var.connections_to_alarm
  alarm_actions       = [var.sns_topic_arn]

  dimensions = {
    DBClusterIdentifier = aws_rds_cluster.mysql.cluster_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_high_deadlocks" {
  count               = terraform.workspace == "pro" ? 1 : 0
  alarm_name          = "${terraform.workspace}-${var.project}-rds-high-deadlocks"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "Deadlocks"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Average"
  threshold           = var.deadlocks_to_alarm
  alarm_actions       = [var.sns_topic_arn]
  alarm_description   = "This metric checks for rds deadlocks rate in 5 minutes"

  dimensions = {
    DBClusterIdentifier = aws_rds_cluster.mysql.cluster_identifier
  }
}
