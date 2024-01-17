data "archive_file" "authentication_package" {
  type = "zip"

  source {
    content = templatefile("${path.module}/source/index.js", {
      authen_username = var.authen_username
      authen_password = var.authen_password
    })
    filename = "authentication.js"
  }
  output_path = "${path.module}/authentication.zip"
}

resource "aws_lambda_function" "authentication_lambda" {
  function_name = "${terraform.workspace}-${var.project}-basic-authentication"
  role          = aws_iam_role.basic_authentication.arn
  handler       = "authentication.handler"
  runtime       = "nodejs18.x"
  publish       = true

  filename         = data.archive_file.authentication_package.output_path
  source_code_hash = filebase64sha256(data.archive_file.authentication_package.output_path)
}
