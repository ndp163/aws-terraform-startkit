resource "aws_iam_role" "codebuild_role" {
  name = "${terraform.workspace}-${var.project}-codebuild-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "codebuild.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "codebuild_policy" {
  name   = "${terraform.workspace}-${var.project}-codebuild-policy"
  role   = aws_iam_role.codebuild_role.id
  policy = file("${path.module}/policy/codebuild-policy.json")
}
