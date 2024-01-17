output "service_name" {
  value = aws_ecs_service.backend.name
}

output "cluster_name" {
  value = aws_ecs_cluster.backend.name
}

output "container_name" {
  value = local.container_name
}

output "container_port" {
  value = local.container_port
}

output "security_group_id" {
  value = aws_security_group.ecs_backend_service.id
}
