resource "aws_elasticache_subnet_group" "redis" {
  name        = "${terraform.workspace}-redis-subnet-group"
  subnet_ids  = var.subnet_ids
  description = "Redis subnet group"
}

resource "aws_elasticache_parameter_group" "redis" {
  name   = "${terraform.workspace}-${var.project}-param-group"
  family = "redis7"
}

resource "aws_elasticache_replication_group" "redis" {
  engine               = "redis"
  parameter_group_name = aws_elasticache_parameter_group.redis.name
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
  security_group_ids   = [aws_security_group.redis.id]
  replication_group_id = "${terraform.workspace}-${var.project}-redis"
  node_type            = var.instance_class
  engine_version       = "7.1"
  port                 = 6379
  apply_immediately    = false # set false when server was stable

  lifecycle {
    ignore_changes = [engine_version]
  }

  snapshot_window          = "15:00-16:00" # 00:00 -> 1:00 am JST
  snapshot_retention_limit = 7
}
