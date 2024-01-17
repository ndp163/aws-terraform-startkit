resource "aws_appautoscaling_target" "rds_scale_target" {
  service_namespace  = "rds"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  resource_id        = "cluster:${aws_rds_cluster.mysql.cluster_identifier}"
  min_capacity       = var.min_capacity
  max_capacity       = var.max_capacity
}

resource "aws_appautoscaling_policy" "scale_cpu_policy" {
  name               = "${terraform.workspace}-${var.project}-rds-scale-cpu-policy"
  policy_type        = "TargetTrackingScaling"
  service_namespace  = aws_appautoscaling_target.rds_scale_target.service_namespace
  resource_id        = aws_appautoscaling_target.rds_scale_target.resource_id
  scalable_dimension = aws_appautoscaling_target.rds_scale_target.scalable_dimension

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "RDSReaderAverageCPUUtilization"
    }

    target_value       = var.cpu_to_alarm
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}

resource "aws_appautoscaling_policy" "scale_connections_policy" {
  name               = "${terraform.workspace}-${var.project}-rds-scale-connections-policy"
  policy_type        = "TargetTrackingScaling"
  service_namespace  = aws_appautoscaling_target.rds_scale_target.service_namespace
  resource_id        = aws_appautoscaling_target.rds_scale_target.resource_id
  scalable_dimension = aws_appautoscaling_target.rds_scale_target.scalable_dimension

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "RDSReaderAverageDatabaseConnections"
    }

    target_value       = var.connections_to_alarm
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}
