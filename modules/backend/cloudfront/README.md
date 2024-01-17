# cloudfront

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
| [aws_cloudfront_distribution.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_cert"></a> [acm\_cert](#input\_acm\_cert) | n/a | `any` | n/a | yes |
| <a name="input_alb_domain"></a> [alb\_domain](#input\_alb\_domain) | Domain name of ALB | `string` | n/a | yes |
| <a name="input_log_bucket_domain_name"></a> [log\_bucket\_domain\_name](#input\_log\_bucket\_domain\_name) | bucket to store access log from Cloudfront | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_waf_arn"></a> [waf\_arn](#input\_waf\_arn) | WAF arn for Cloudfront | `string` | n/a | yes |
| <a name="input_x_alb_key"></a> [x\_alb\_key](#input\_x\_alb\_key) | ALB key to verify request from cloudfront to alb | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
