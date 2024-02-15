# frontend

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
| <a name="module_codebuild"></a> [codebuild](#module\_codebuild) | ./codebuild | n/a |
| <a name="module_pipeline"></a> [pipeline](#module\_pipeline) | ./pipeline | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ./s3 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authen_password"></a> [authen\_password](#input\_authen\_password) | n/a | `string` | n/a | yes |
| <a name="input_authen_username"></a> [authen\_username](#input\_authen\_username) | n/a | `string` | n/a | yes |
| <a name="input_codebuild_env_vars"></a> [codebuild\_env\_vars](#input\_codebuild\_env\_vars) | n/a | `any` | n/a | yes |
| <a name="input_frontend_domain"></a> [frontend\_domain](#input\_frontend\_domain) | n/a | `string` | n/a | yes |
| <a name="input_git_repository_branch"></a> [git\_repository\_branch](#input\_git\_repository\_branch) | n/a | `string` | n/a | yes |
| <a name="input_git_repository_name"></a> [git\_repository\_name](#input\_git\_repository\_name) | n/a | `string` | n/a | yes |
| <a name="input_git_repository_owner"></a> [git\_repository\_owner](#input\_git\_repository\_owner) | n/a | `string` | n/a | yes |
| <a name="input_log_bucket_domain_name"></a> [log\_bucket\_domain\_name](#input\_log\_bucket\_domain\_name) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
