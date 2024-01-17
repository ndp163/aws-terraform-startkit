# sqs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sqs_queue.iot_cmd_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.iot_message_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.iot_cmd_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_sqs_queue_policy.iot_message_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_iam_policy_document.iot_cmd_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.iot_message_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_iot_account_id"></a> [iot\_account\_id](#input\_iot\_account\_id) | IoT Account ID | `string` | n/a | yes |
| <a name="input_iot_raw_data_bucket"></a> [iot\_raw\_data\_bucket](#input\_iot\_raw\_data\_bucket) | IoT RawData S3 bucket | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The backend-iot project name | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqs_cmd_response_arn"></a> [sqs\_cmd\_response\_arn](#output\_sqs\_cmd\_response\_arn) | n/a |
| <a name="output_sqs_itchy_data_arn"></a> [sqs\_itchy\_data\_arn](#output\_sqs\_itchy\_data\_arn) | n/a |
| <a name="output_sqs_queue_name"></a> [sqs\_queue\_name](#output\_sqs\_queue\_name) | n/a |
| <a name="output_sqs_queue_url"></a> [sqs\_queue\_url](#output\_sqs\_queue\_url) | n/a |
<!-- END_TF_DOCS -->
