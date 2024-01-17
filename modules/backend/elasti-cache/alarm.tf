resource "aws_cloudwatch_metric_alarm" "redis_cpu_high" {
  count = terraform.workspace == "pro" ? length(aws_elasticache_replication_group.redis.member_clusters) : 0

  alarm_name          = "${terraform.workspace}-${var.project}-redis-cpu-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ElastiCache"
  period              = "60"
  statistic           = "Average"
  threshold           = var.redis_cpu_threshold
  alarm_actions       = [var.sns_topic_arn]
  dimensions = {
    CacheClusterId = tolist(aws_elasticache_replication_group.redis.member_clusters)[count.index]
  }
}

resource "aws_cloudwatch_metric_alarm" "redis_freeable_memory_low" {
  count = terraform.workspace == "pro" ? length(aws_elasticache_replication_group.redis.member_clusters) : 0

  alarm_name          = "${terraform.workspace}-${var.project}-redis-freeable-memory-low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "FreeableMemory"
  namespace           = "AWS/ElastiCache"
  period              = "60"
  statistic           = "Average"
  threshold           = tostring(var.redis_db_memory * var.redis_db_freeable_memory_threshold / 100)
  alarm_actions       = [var.sns_topic_arn]
  alarm_description   = "This metric checks for low redis freeable memory"
  dimensions = {
    CacheClusterId = tolist(aws_elasticache_replication_group.redis.member_clusters)[count.index]
  }
}
