# Schedule cron job
resource "aws_cloudwatch_event_rule" "this" {
  name                = "${terraform.workspace}-${var.project}-cron-job"
  schedule_expression = var.cron_job_schedule
}

resource "aws_cloudwatch_event_target" "this" {
  rule     = aws_cloudwatch_event_rule.this.name
  arn      = var.batch_job_queue_arn
  role_arn = aws_iam_role.this.arn

  batch_target {
    job_definition = var.batch_job_definition_arn
    job_name       = "${terraform.workspace}-${var.project}-cron-job"
  }
}
