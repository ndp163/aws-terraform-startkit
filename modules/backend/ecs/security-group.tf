resource "aws_security_group" "ecs_backend_service" {
  name   = "${terraform.workspace}-${var.project}-ecs-backend-service"
  vpc_id = var.vpc_id

  ingress {
    from_port       = local.container_port
    to_port         = local.container_port
    protocol        = "tcp"
    security_groups = var.allowed_security_groups # allow from loadbalance sg
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${terraform.workspace}-${var.project}-ecs-backend-service"
  }
}
