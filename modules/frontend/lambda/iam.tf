resource "aws_iam_role" "basic_authentication" {
  name = "${terraform.workspace}-${var.project}-basic-authentication-role"
  assume_role_policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Action : "sts:AssumeRole",
        Effect : "Allow",
        Principal : {
          Service : ["lambda.amazonaws.com", "edgelambda.amazonaws.com"]
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "basic_authentication_policy" {
  name   = "${terraform.workspace}-${var.project}-basic-authentication-lambda-policy"
  role   = aws_iam_role.basic_authentication.id
  policy = file("${path.module}/policy/lambda-policy.json")
}
