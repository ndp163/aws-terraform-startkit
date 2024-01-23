resource "aws_iam_role" "this" {
  name = "${terraform.workspace}-${var.project}-codebuild-build-role"
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

resource "aws_iam_role_policy" "this" {
  name   = "${terraform.workspace}-${var.project}-codebuild-build-policy"
  role   = aws_iam_role.this.id
  policy = file("${path.module}/policy/codebuild-policy.json")
}
