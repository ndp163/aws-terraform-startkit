# backend

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
| <a name="module_alb"></a> [alb](#module\_alb) | ./alb | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ./bastion | n/a |
| <a name="module_cloudfront"></a> [cloudfront](#module\_cloudfront) | ./cloudfront | n/a |
| <a name="module_codebuild"></a> [codebuild](#module\_codebuild) | ./codebuild | n/a |
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./ecr | n/a |
| <a name="module_ecs"></a> [ecs](#module\_ecs) | ./ecs | n/a |
| <a name="module_pipeline"></a> [pipeline](#module\_pipeline) | ./pipeline | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ./rds | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ./s3 | n/a |
| <a name="module_waf"></a> [waf](#module\_waf) | ./waf | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codebuild_build_env_vars"></a> [codebuild\_build\_env\_vars](#input\_codebuild\_build\_env\_vars) | Environment variables for codebuild of backend building stage | `any` | n/a | yes |
| <a name="input_codebuild_testing_env_vars"></a> [codebuild\_testing\_env\_vars](#input\_codebuild\_testing\_env\_vars) | Environment variables for codebuild of backend testing stage | `any` | n/a | yes |
| <a name="input_cpu_to_scale_down"></a> [cpu\_to\_scale\_down](#input\_cpu\_to\_scale\_down) | CPU % to Scale Down the number of containers | `any` | n/a | yes |
| <a name="input_cpu_to_scale_up"></a> [cpu\_to\_scale\_up](#input\_cpu\_to\_scale\_up) | CPU % to Scale Up the number of containers | `any` | n/a | yes |
| <a name="input_desired_tasks"></a> [desired\_tasks](#input\_desired\_tasks) | Number of containers desired to run the application task | `any` | n/a | yes |
| <a name="input_git_repository_branch"></a> [git\_repository\_branch](#input\_git\_repository\_branch) | Build branch aka Master | `any` | n/a | yes |
| <a name="input_git_repository_name"></a> [git\_repository\_name](#input\_git\_repository\_name) | Name of repository | `any` | n/a | yes |
| <a name="input_git_repository_owner"></a> [git\_repository\_owner](#input\_git\_repository\_owner) | Owner from Repository | `any` | n/a | yes |
| <a name="input_log_bucket_domain_name"></a> [log\_bucket\_domain\_name](#input\_log\_bucket\_domain\_name) | bucket to store access log from Cloudfront | `string` | n/a | yes |
| <a name="input_max_tasks"></a> [max\_tasks](#input\_max\_tasks) | Maximum | `any` | n/a | yes |
| <a name="input_memory_to_scale_down"></a> [memory\_to\_scale\_down](#input\_memory\_to\_scale\_down) | MEMORY % to scale down the number of containers | `number` | n/a | yes |
| <a name="input_memory_to_scale_up"></a> [memory\_to\_scale\_up](#input\_memory\_to\_scale\_up) | MEMORY % to scale up the number of containers | `number` | n/a | yes |
| <a name="input_min_tasks"></a> [min\_tasks](#input\_min\_tasks) | Minimum | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `any` | n/a | yes |
| <a name="input_rds_connections_to_alarm"></a> [rds\_connections\_to\_alarm](#input\_rds\_connections\_to\_alarm) | n/a | `number` | n/a | yes |
| <a name="input_rds_cpu_to_alarm"></a> [rds\_cpu\_to\_alarm](#input\_rds\_cpu\_to\_alarm) | RDS threshold to trigger alarm | `number` | n/a | yes |
| <a name="input_rds_deadlocks_to_alarm"></a> [rds\_deadlocks\_to\_alarm](#input\_rds\_deadlocks\_to\_alarm) | n/a | `number` | n/a | yes |
| <a name="input_rds_instance_class"></a> [rds\_instance\_class](#input\_rds\_instance\_class) | n/a | `string` | n/a | yes |
| <a name="input_rds_max_capacity"></a> [rds\_max\_capacity](#input\_rds\_max\_capacity) | n/a | `number` | n/a | yes |
| <a name="input_rds_memory"></a> [rds\_memory](#input\_rds\_memory) | n/a | `number` | n/a | yes |
| <a name="input_rds_memory_to_alarm"></a> [rds\_memory\_to\_alarm](#input\_rds\_memory\_to\_alarm) | n/a | `number` | n/a | yes |
| <a name="input_rds_min_capacity"></a> [rds\_min\_capacity](#input\_rds\_min\_capacity) | n/a | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region for the VPC | `any` | n/a | yes |
| <a name="input_task_cpu"></a> [task\_cpu](#input\_task\_cpu) | Task CPU Limit | `any` | n/a | yes |
| <a name="input_task_memory"></a> [task\_memory](#input\_task\_memory) | Task Memory Limit | `any` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | n/a | <pre>object({<br>    id               = string<br>    route_table_id   = string<br>    public_subnet_1a = string<br>    public_subnet_1c = string<br>  })</pre> | n/a | yes |
| <a name="input_x_alb_key"></a> [x\_alb\_key](#input\_x\_alb\_key) | ALB key to verify request from cloudfront to alb | `string` | n/a | yes |
| <a name="input_rds_password"></a> [rds\_password](#input\_rds\_password) | The password of the database | `string` | `"password"` | no |
| <a name="input_rds_username"></a> [rds\_username](#input\_rds\_username) | The username of the database | `string` | `"admin"` | no |
| <a name="input_sns_topic_arn"></a> [sns\_topic\_arn](#input\_sns\_topic\_arn) | SNS topic | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
