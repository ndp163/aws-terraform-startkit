resource "aws_security_group" "this" {
  name   = "${terraform.workspace}-${var.project}-bastion"
  vpc_id = var.vpc_id

  tags = {
    Name = "${terraform.workspace}-${var.project}-bastion"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = local.allowed_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
