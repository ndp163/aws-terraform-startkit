resource "aws_security_group" "cron_job" {
  name   = "${terraform.workspace}-${var.project}-cron-job"
  vpc_id = aws_vpc.cluster_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${terraform.workspace}-${var.project}-cron-job"
  }
}
