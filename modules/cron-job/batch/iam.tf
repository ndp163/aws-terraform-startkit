resource "aws_iam_role" "this" {
  name = "${terraform.workspace}-${var.project}-cron-job-role"
  assume_role_policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Action : "sts:AssumeRole",
        Effect : "Allow",
        Principal : {
          Service : "batch.amazonaws.com"
        }
      },
      {
        Action : "sts:AssumeRole",
        Effect : "Allow",
        Principal : {
          Service : "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "this" {
  name   = "${terraform.workspace}-${var.project}-cron-job-policy"
  policy = file("${path.module}/policy/taskExecPolicy.json")
  role   = aws_iam_role.this.id
}

resource "aws_iam_role_policy_attachment" "cron_job_policy_attachment_1" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}

resource "aws_iam_role_policy_attachment" "cron_job_policy_attachment_2" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
}
