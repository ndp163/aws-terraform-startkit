output "sqs_itchy_data_arn" {
  value = aws_sqs_queue.iot_message_queue.arn
}

output "sqs_queue_name" {
  value = aws_sqs_queue.iot_message_queue.name
}

output "sqs_queue_url" {
  value = aws_sqs_queue.iot_message_queue.url
}

output "sqs_cmd_response_arn" {
  value = aws_sqs_queue.iot_cmd_response_queue.arn
}
