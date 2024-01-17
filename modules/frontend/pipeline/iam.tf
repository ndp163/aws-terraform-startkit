resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline-${terraform.workspace}-${var.project}-role"
  assume_role_policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Action : "sts:AssumeRole",
        Effect : "Allow",
        Principal : {
          Service : "codepipeline.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name   = "codepipeline-${terraform.workspace}-${var.project}-policy"
  role   = aws_iam_role.codepipeline_role.id
  policy = file("${path.module}/policy/codepipeline-policy.json")
}
