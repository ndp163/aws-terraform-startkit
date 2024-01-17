resource "aws_cloudwatch_log_group" "backend_logs" {
  name              = "${terraform.workspace}-${var.project}-backend-logs"
  retention_in_days = 90 # 3 months
}
