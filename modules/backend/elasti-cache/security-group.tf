resource "aws_security_group" "redis" {
  name   = "${terraform.workspace}-${var.project}-redis"
  vpc_id = var.vpc_id
  tags = {
    Name = "${terraform.workspace}-${var.project}-redis"
  }

  ingress {
    protocol        = "tcp"
    from_port       = 6379
    to_port         = 6379
    security_groups = var.allowed_security_group_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
