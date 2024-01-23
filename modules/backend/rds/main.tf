resource "aws_db_subnet_group" "rds_mysql" {
  name        = "${terraform.workspace}-${var.project}-rds-mysql"
  description = "RDS subnet group"
  subnet_ids  = var.subnet_ids
}

resource "aws_db_instance" "mysql" {
  allocated_storage       = 10 # 10 GB
  identifier              = "${terraform.workspace}-${var.project}-mysql"
  db_subnet_group_name    = aws_db_subnet_group.rds_mysql.name
  vpc_security_group_ids  = [aws_security_group.rds_mysql.id]
  engine                  = "mysql"
  engine_version          = "8.0.35" // or "8.0.mysql_aurora.3.04.1"
  instance_class          = var.instance_class
  username                = var.username
  password                = var.password
  db_name                 = replace(var.project, "-", "")
  backup_retention_period = 7
  backup_window           = "15:00-00:00"
  deletion_protection     = true
  parameter_group_name    = aws_db_parameter_group.mysql.name

  lifecycle {
    ignore_changes = [
      engine_version,
    ]
  }

  tags = {
    Name = "${terraform.workspace}-${var.project}-mysql"
  }
}

resource "aws_db_parameter_group" "mysql" {
  name        = "${terraform.workspace}-${var.project}-rds-mysql"
  family      = "mysql8.0"
  description = "MySQL 8.0 parameter group"

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
    name         = "log_output"
    value        = "FILE"
    apply_method = "immediate"
  }
}
