resource "aws_security_group" "ecs_backend_loadbalance" {
  name        = "${terraform.workspace}-${var.project}-ecs-backend-loadbalance"
  description = "ALB Security Group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${terraform.workspace}-${var.project}-ecs-backend-loadbalance"
  }
}
