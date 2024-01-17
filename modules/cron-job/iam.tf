data "local_file" "cron-job-assume-role" {
  filename = "${path.module}/policy/taskExecAssumeRole.json"
}

data "local_file" "cron-job-policy" {
  filename = "${path.module}/policy/taskExecPolicy.json"
}

resource "aws_iam_role" "cron-job" {
  name               = "${terraform.workspace}-${var.project}-cron-job-role"
  assume_role_policy = data.local_file.cron-job-assume-role.content
}

resource "aws_iam_policy" "cron-job" {
  name   = "${terraform.workspace}-${var.project}-cron-job-policy"
  policy = data.local_file.cron-job-policy.content
}

resource "aws_iam_role_policy_attachment" "cron-job-policy-attachment-1" {
  role       = aws_iam_role.cron-job.name
  policy_arn = aws_iam_policy.cron-job.arn
}

resource "aws_iam_role_policy_attachment" "cron-job-policy-attachment-2" {
  role       = aws_iam_role.cron-job.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}

resource "aws_iam_role_policy_attachment" "cron-job-policy-attachment-3" {
  role       = aws_iam_role.cron-job.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
}

# Cron job events
data "local_file" "events-assume-role" {
  filename = "${path.module}/policy/eventsAssumeRole.json"
}

data "local_file" "events-policy" {
  filename = "${path.module}/policy/eventsPolicy.json"
}

resource "aws_iam_role" "cron-job-events" {
  name               = "${terraform.workspace}-${var.project}-cron-job-events-role"
  assume_role_policy = data.local_file.events-assume-role.content
}

resource "aws_iam_policy" "cron-job-events" {
  name   = "${terraform.workspace}-${var.project}-cron-job-events-policy"
  policy = data.local_file.events-policy.content
}

resource "aws_iam_role_policy_attachment" "cron-job-events-policy-attachment-1" {
  role       = aws_iam_role.cron-job-events.name
  policy_arn = aws_iam_policy.cron-job-events.arn
}
