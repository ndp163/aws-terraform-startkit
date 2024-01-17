output "target_group_arn" {
  value = aws_alb_target_group.backend.arn
}

output "security_group_id" {
  value = aws_security_group.ecs_backend_loadbalance.id
}

output "domain_name" {
  value = aws_alb.backend.dns_name
}
