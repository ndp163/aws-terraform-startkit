resource "aws_cloudwatch_metric_alarm" "ecs_cpu_utilization_high" {
  alarm_name          = "${terraform.workspace}-${var.project}-ecs-cpu-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = var.cpu_to_scale_up

  dimensions = {
    ClusterName = aws_ecs_cluster.backend.name
    ServiceName = aws_ecs_service.backend.name
  }

  alarm_actions = concat(
    [aws_appautoscaling_policy.scale_up_policy.arn],
    terraform.workspace == "pro" ? [var.sns_topic_arn] : []
  )
}

resource "aws_cloudwatch_metric_alarm" "ecs_cpu_utilization_low" {
  alarm_name          = "${terraform.workspace}-${var.project}-ecs-cpu-low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = var.cpu_to_scale_down

  dimensions = {
    ClusterName = aws_ecs_cluster.backend.name
    ServiceName = aws_ecs_service.backend.name
  }

  alarm_actions = [aws_appautoscaling_policy.scale_down_policy.arn]
}

resource "aws_cloudwatch_metric_alarm" "ecs_memory_high" {
  alarm_name          = "${terraform.workspace}-${var.project}-ecs-memory-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = var.memory_to_scale_up

  dimensions = {
    ClusterName = aws_ecs_cluster.backend.name
    ServiceName = aws_ecs_service.backend.name
  }

  alarm_actions = concat(
    [aws_appautoscaling_policy.scale_up_policy.arn],
    terraform.workspace == "pro" ? [var.sns_topic_arn] : []
  )
}

resource "aws_cloudwatch_metric_alarm" "ecs_memory_low" {
  alarm_name          = "${terraform.workspace}-${var.project}-ecs-memory-low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = var.memory_to_scale_down

  dimensions = {
    ClusterName = aws_ecs_cluster.backend.name
    ServiceName = aws_ecs_service.backend.name
  }

  alarm_actions = [aws_appautoscaling_policy.scale_down_policy.arn]
}
