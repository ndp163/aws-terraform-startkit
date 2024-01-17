# acm

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.east"></a> [aws.east](#provider\_aws.east) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.frontend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_frontend_domain"></a> [frontend\_domain](#input\_frontend\_domain) | Domain of frontend | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontend_acm_arn"></a> [frontend\_acm\_arn](#output\_frontend\_acm\_arn) | n/a |
| <a name="output_frontend_domain_name"></a> [frontend\_domain\_name](#output\_frontend\_domain\_name) | n/a |
<!-- END_TF_DOCS -->
