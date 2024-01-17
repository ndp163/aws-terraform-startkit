resource "aws_db_subnet_group" "rds_mysql" {
  name        = "${terraform.workspace}-${var.project}-rds-mysql"
  description = "RDS subnet group"
  subnet_ids  = var.subnet_ids
}

resource "aws_rds_cluster" "mysql" {
  cluster_identifier              = "${terraform.workspace}-${var.project}-mysql"
  db_subnet_group_name            = aws_db_subnet_group.rds_mysql.name
  vpc_security_group_ids          = [aws_security_group.rds_mysql.id]
  engine_mode                     = "provisioned"
  engine                          = "aurora-mysql"
  engine_version                  = "5.7.mysql_aurora.2.11.4" // or "8.0.mysql_aurora.3.04.1"
  master_username                 = var.username
  master_password                 = var.password
  database_name                   = var.project
  backup_retention_period         = 7
  preferred_backup_window         = "15:00-00:00"
  deletion_protection             = true
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.mysql.name

  lifecycle {
    ignore_changes = [
      engine_version,
      availability_zones
    ]
  }

  tags = {
    Name = "${terraform.workspace}-${var.project}-mysql"
  }
}

resource "aws_rds_cluster_instance" "mysql" {
  count              = 1
  identifier         = "${terraform.workspace}-${var.project}-mysql-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.mysql.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.mysql.engine
  engine_version     = aws_rds_cluster.mysql.engine_version

  lifecycle {
    ignore_changes = [engine_version, instance_class]
  }
}

resource "aws_rds_cluster_parameter_group" "mysql" {
  name        = "${terraform.workspace}-${var.project}-rds-cluster-mysql"
  family      = "aurora-mysql5.7"
  description = "Aurora MySQL 5.7 cluster parameter group"

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8mb4"
  }

  parameter {
    name  = "collation_server"
    value = "utf8mb4_unicode_ci"
  }

  parameter {
    name  = "character_set_connection"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_results"
    value = "utf8mb4"
  }

  parameter {
    name         = "connect_timeout"
    value        = 60 // 1 minute
    apply_method = "immediate"
  }

  parameter {
    name         = "innodb_lock_wait_timeout"
    value        = 300 // 5 minutes
    apply_method = "immediate"
  }

  parameter {
    name         = "slow_query_log"
    value        = 1
    apply_method = "immediate"
  }

  parameter {
    name         = "long_query_time"
    value        = 5
    apply_method = "immediate"
  }

  # parameter {
  #   name         = "general_log"
  #   value        = 1
  #   apply_method = "immediate"
  # }

  parameter {
    name  = "log_output"
    value = "FILE"
  }
}

# resource "aws_rds_cluster_endpoint" "database_endpoint" {
#   cluster_identifier          = aws_rds_cluster.mysql.id
#   cluster_endpoint_identifier = "writer"
#   custom_endpoint_type        = "ANY"
# }
