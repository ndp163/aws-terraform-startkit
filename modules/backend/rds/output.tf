output "cluster_endpoint" {
  value = aws_db_instance.mysql.address
}

output "port" {
  value = aws_db_instance.mysql.port
}

output "database_name" {
  value = aws_db_instance.mysql.db_name
}

output "rds_sg_id" {
  value = aws_security_group.rds_mysql.id
}
