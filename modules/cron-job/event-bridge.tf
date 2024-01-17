# Schedule cron job
resource "aws_cloudwatch_event_rule" "cron_job" {
  count = length(var.cron_job_configs)

  name                = "${terraform.workspace}-${var.project}-rule-cron-job-${var.cron_job_configs[count.index].name}"
  schedule_expression = var.cron_job_configs[count.index].schedule
}

resource "aws_cloudwatch_event_target" "cron_job" {
  count = length(var.cron_job_configs)

  rule     = aws_cloudwatch_event_rule.cron_job[count.index].name
  arn      = aws_batch_job_queue.cron_job.arn
  role_arn = aws_iam_role.cron-job-events.arn

  batch_target {
    job_definition = aws_batch_job_definition.cron_job[count.index].arn
    job_name       = "${terraform.workspace}-${var.project}-job-${var.cron_job_configs[count.index].name}"
  }
}
