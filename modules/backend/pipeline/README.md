# pipeline

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
| [aws_codepipeline.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_codestarconnections_connection.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codestarconnections_connection) | resource |
| [aws_iam_role.codepipeline_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.codepipeline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifact_bucket"></a> [artifact\_bucket](#input\_artifact\_bucket) | n/a | `string` | n/a | yes |
| <a name="input_codebuild_build_name"></a> [codebuild\_build\_name](#input\_codebuild\_build\_name) | n/a | `string` | n/a | yes |
| <a name="input_codebuild_testing_name"></a> [codebuild\_testing\_name](#input\_codebuild\_testing\_name) | n/a | `string` | n/a | yes |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_ecs_service_name"></a> [ecs\_service\_name](#input\_ecs\_service\_name) | n/a | `string` | n/a | yes |
| <a name="input_git_repository_branch"></a> [git\_repository\_branch](#input\_git\_repository\_branch) | Build branch aka Master | `any` | n/a | yes |
| <a name="input_git_repository_name"></a> [git\_repository\_name](#input\_git\_repository\_name) | Name of repository | `any` | n/a | yes |
| <a name="input_git_repository_owner"></a> [git\_repository\_owner](#input\_git\_repository\_owner) | Owner from Repository | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
