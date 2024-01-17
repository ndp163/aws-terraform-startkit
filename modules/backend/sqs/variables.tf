variable "project_name" {
  description = "The backend-iot project name"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "iot_account_id" {
  description = "IoT Account ID"
  type        = string
}

variable "iot_raw_data_bucket" {
  description = "IoT RawData S3 bucket"
  type        = string
}
