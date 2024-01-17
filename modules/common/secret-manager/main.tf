resource "aws_secretsmanager_secret" "secret" {
  name = "${terraform.workspace}/${var.project}-secret"
}

resource "aws_secretsmanager_secret_version" "secret" {
  secret_id = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode({
  })
}
