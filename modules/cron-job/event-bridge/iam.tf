resource "aws_iam_role" "this" {
  name = "${terraform.workspace}-${var.project}-event-bridge-role"
  assume_role_policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Action : "sts:AssumeRole",
        Effect : "Allow",
        Principal : {
          Service : "events.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "this" {
  name   = "${terraform.workspace}-${var.project}-event-bridge-policy"
  policy = file("${path.module}/policy/eventsPolicy.json")
  role   = aws_iam_role.this.id
}
