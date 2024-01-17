resource "aws_sqs_queue" "iot_message_queue" {
  name = "${terraform.workspace}-iot-message-queue"

  delay_seconds              = 0
  max_message_size           = 262144 # 256KB
  message_retention_seconds  = 604800 # 7 days
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 120
}

resource "aws_sqs_queue_policy" "iot_message_queue" {
  queue_url = aws_sqs_queue.iot_message_queue.id
  policy    = data.aws_iam_policy_document.iot_message_queue.json
}

resource "aws_sqs_queue" "iot_cmd_queue" {
  name = "${terraform.workspace}-iot-cmd-queue"

  delay_seconds              = 0
  max_message_size           = 262144 # 256KB
  message_retention_seconds  = 604800 # 7 days
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 120
}

resource "aws_sqs_queue_policy" "iot_cmd_queue" {
  queue_url = aws_sqs_queue.iot_cmd_queue.id

  policy = data.aws_iam_policy_document.iot_cmd_queue.json
}
