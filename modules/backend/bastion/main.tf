resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "local_sensitive_file" "this" {
  filename        = "${path.module}/${terraform.workspace}-${var.project}-bastion-key.pem"
  content         = tls_private_key.this.private_key_pem
  file_permission = "0400"
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  owners = ["amazon"]
}

resource "aws_key_pair" "this" {
  key_name   = "${terraform.workspace}-${var.project}-bastion-key"
  public_key = tls_private_key.this.public_key_openssh
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t2.nano"
  key_name               = aws_key_pair.this.key_name
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.this.id]
  subnet_id              = var.subnet_id

  tags = {
    Name = "${terraform.workspace}-${var.project}-bastion"
  }
}
