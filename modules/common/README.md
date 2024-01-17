# common

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lambda"></a> [lambda](#module\_lambda) | ./lambda | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ./s3 | n/a |
| <a name="module_secret-manager"></a> [secret-manager](#module\_secret-manager) | ./secret-manager | n/a |
| <a name="module_sns"></a> [sns](#module\_sns) | ./sns | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lambda_concurrency_threshold"></a> [lambda\_concurrency\_threshold](#input\_lambda\_concurrency\_threshold) | n/a | `number` | n/a | yes |
| <a name="input_notification_subscription_mails"></a> [notification\_subscription\_mails](#input\_notification\_subscription\_mails) | n/a | `list(string)` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | n/a | yes |
| <a name="input_public_subnet_1"></a> [public\_subnet\_1](#input\_public\_subnet\_1) | n/a | `string` | n/a | yes |
| <a name="input_public_subnet_2"></a> [public\_subnet\_2](#input\_public\_subnet\_2) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_log_bucket_domain_name"></a> [s3\_log\_bucket\_domain\_name](#output\_s3\_log\_bucket\_domain\_name) | n/a |
| <a name="output_sns_notification_topic_arn"></a> [sns\_notification\_topic\_arn](#output\_sns\_notification\_topic\_arn) | n/a |
| <a name="output_vpc_config"></a> [vpc\_config](#output\_vpc\_config) | n/a |
<!-- END_TF_DOCS -->
