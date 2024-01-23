resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/batch/${terraform.workspace}-${var.project}-cron-job"
  retention_in_days = 90 # 3 months
}
