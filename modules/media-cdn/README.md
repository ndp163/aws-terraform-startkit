# media-cdn

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
| <a name="module_acm"></a> [acm](#module\_acm) | ./acm | n/a |
| <a name="module_cloudfront"></a> [cloudfront](#module\_cloudfront) | ./cloudfront | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ./s3 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_log_bucket_domain_name"></a> [log\_bucket\_domain\_name](#input\_log\_bucket\_domain\_name) | n/a | `string` | n/a | yes |
| <a name="input_media_cdn_domain"></a> [media\_cdn\_domain](#input\_media\_cdn\_domain) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_key_path"></a> [cloudfront\_key\_path](#output\_cloudfront\_key\_path) | n/a |
| <a name="output_cloudfront_public_key_id"></a> [cloudfront\_public\_key\_id](#output\_cloudfront\_public\_key\_id) | n/a |
<!-- END_TF_DOCS -->
