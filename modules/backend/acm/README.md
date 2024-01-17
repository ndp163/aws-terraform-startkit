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
| [aws_acm_certificate.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_domain"></a> [backend\_domain](#input\_backend\_domain) | Domain of backend | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_cert"></a> [acm\_cert](#output\_acm\_cert) | n/a |
<!-- END_TF_DOCS -->
