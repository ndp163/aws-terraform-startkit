output "cluster_endpoint" {
  value = aws_rds_cluster.mysql.endpoint
}

output "port" {
  value = aws_rds_cluster.mysql.port
}

output "rds_sg_id" {
  value = aws_security_group.rds_mysql.id
}
