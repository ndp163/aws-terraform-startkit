data "local_file" "cloud_front_private_key" {
  filename = var.cloufront_key_path
}

resource "aws_secretsmanager_secret" "secret" {
  name = "${terraform.workspace}/${var.project}-secret"
}

resource "aws_secretsmanager_secret_version" "secret" {
  secret_id = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode({
    CLOUDFRONT_PRIVATE_KEY : "${data.local_file.cloud_front_private_key.content}"
  })
}
