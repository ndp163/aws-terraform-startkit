# codebuild

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_build"></a> [build](#module\_build) | ./build | n/a |
| <a name="module_testing"></a> [testing](#module\_testing) | ./testing | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.testing](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codebuild_build_env_vars"></a> [codebuild\_build\_env\_vars](#input\_codebuild\_build\_env\_vars) | n/a | `any` | n/a | yes |
| <a name="input_codebuild_testing_env_vars"></a> [codebuild\_testing\_env\_vars](#input\_codebuild\_testing\_env\_vars) | n/a | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codebuild_build_name"></a> [codebuild\_build\_name](#output\_codebuild\_build\_name) | n/a |
| <a name="output_codebuild_testing_name"></a> [codebuild\_testing\_name](#output\_codebuild\_testing\_name) | n/a |
<!-- END_TF_DOCS -->
