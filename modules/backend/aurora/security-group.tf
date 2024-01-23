resource "aws_security_group" "rds_mysql" {
  name   = "${terraform.workspace}-${var.project}-rds-mysql"
  vpc_id = var.vpc_id

  tags = {
    Name = "${terraform.workspace}-${var.project}-rds-mysql"
  }

  ingress {
    protocol        = "tcp"
    from_port       = 3306
    to_port         = 3306
    security_groups = var.allowed_security_group_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
