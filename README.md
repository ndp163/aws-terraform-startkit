# aws-terraform-startkit

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.md updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | > 5.31.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_common"></a> [common](#module\_common) | ./modules/common | n/a |
| <a name="module_media_cdn"></a> [media\_cdn](#module\_media\_cdn) | ./modules/media-cdn | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_git_repository_branch"></a> [backend\_git\_repository\_branch](#input\_backend\_git\_repository\_branch) | Git repository branch of backend | `string` | n/a | yes |
| <a name="input_backend_git_repository_name"></a> [backend\_git\_repository\_name](#input\_backend\_git\_repository\_name) | Git repository name of backend | `string` | n/a | yes |
| <a name="input_backend_git_repository_owner"></a> [backend\_git\_repository\_owner](#input\_backend\_git\_repository\_owner) | Owner name of backend git repository | `string` | n/a | yes |
| <a name="input_codebuild_build_env_vars"></a> [codebuild\_build\_env\_vars](#input\_codebuild\_build\_env\_vars) | Environment variables for codebuild of backend building stage | `any` | n/a | yes |
| <a name="input_cpu_to_scale_down"></a> [cpu\_to\_scale\_down](#input\_cpu\_to\_scale\_down) | CPU % to Scale Down the number of containers | `number` | n/a | yes |
| <a name="input_cpu_to_scale_up"></a> [cpu\_to\_scale\_up](#input\_cpu\_to\_scale\_up) | CPU % to Scale Up the number of containers | `number` | n/a | yes |
| <a name="input_desired_tasks"></a> [desired\_tasks](#input\_desired\_tasks) | Number of desired instances to run backend | `number` | n/a | yes |
| <a name="input_frontend_authen_password"></a> [frontend\_authen\_password](#input\_frontend\_authen\_password) | Basic authen password for frontend | `string` | n/a | yes |
| <a name="input_frontend_authen_username"></a> [frontend\_authen\_username](#input\_frontend\_authen\_username) | Basic authen username for frontend | `string` | n/a | yes |
| <a name="input_frontend_codebuild_env_vars"></a> [frontend\_codebuild\_env\_vars](#input\_frontend\_codebuild\_env\_vars) | codebuild environment variables of FrontEnd pipeline | `any` | n/a | yes |
| <a name="input_frontend_domain"></a> [frontend\_domain](#input\_frontend\_domain) | Domain name of frontend | `string` | n/a | yes |
| <a name="input_frontend_git_repository_branch"></a> [frontend\_git\_repository\_branch](#input\_frontend\_git\_repository\_branch) | Git repository branch of frontend | `string` | n/a | yes |
| <a name="input_frontend_git_repository_name"></a> [frontend\_git\_repository\_name](#input\_frontend\_git\_repository\_name) | Git repository name of frontend | `string` | n/a | yes |
| <a name="input_frontend_git_repository_owner"></a> [frontend\_git\_repository\_owner](#input\_frontend\_git\_repository\_owner) | Owner name of frontend git repository | `string` | n/a | yes |
| <a name="input_max_tasks"></a> [max\_tasks](#input\_max\_tasks) | Maximum instances to run backend | `number` | n/a | yes |
| <a name="input_media_cdn_domain"></a> [media\_cdn\_domain](#input\_media\_cdn\_domain) | Domain name of media cdn | `string` | n/a | yes |
| <a name="input_memory_to_scale_down"></a> [memory\_to\_scale\_down](#input\_memory\_to\_scale\_down) | MEMORY % to scale down the number of containers | `number` | n/a | yes |
| <a name="input_memory_to_scale_up"></a> [memory\_to\_scale\_up](#input\_memory\_to\_scale\_up) | MEMORY % to scale up the number of containers | `number` | n/a | yes |
| <a name="input_min_tasks"></a> [min\_tasks](#input\_min\_tasks) | Minimum instances to run backend | `number` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | n/a | yes |
| <a name="input_public_subnet_1"></a> [public\_subnet\_1](#input\_public\_subnet\_1) | CIDR block of public subnet 1 | `string` | n/a | yes |
| <a name="input_public_subnet_2"></a> [public\_subnet\_2](#input\_public\_subnet\_2) | CIDR block of public subnet 2 | `string` | n/a | yes |
| <a name="input_rds_instance_class"></a> [rds\_instance\_class](#input\_rds\_instance\_class) | Instance class of RDS | `string` | n/a | yes |
| <a name="input_rds_max_capacity"></a> [rds\_max\_capacity](#input\_rds\_max\_capacity) | Max RDS replicas | `number` | n/a | yes |
| <a name="input_rds_min_capacity"></a> [rds\_min\_capacity](#input\_rds\_min\_capacity) | Min RDS replicas | `number` | n/a | yes |
| <a name="input_rds_password"></a> [rds\_password](#input\_rds\_password) | The password of RDS database | `string` | n/a | yes |
| <a name="input_rds_username"></a> [rds\_username](#input\_rds\_username) | The username of RDS database | `string` | n/a | yes |
| <a name="input_redis_instance_class"></a> [redis\_instance\_class](#input\_redis\_instance\_class) | The redis instance type | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region for the VPC | `string` | n/a | yes |
| <a name="input_task_cpu"></a> [task\_cpu](#input\_task\_cpu) | Desired CPU to run your tasks | `number` | n/a | yes |
| <a name="input_task_memory"></a> [task\_memory](#input\_task\_memory) | Desired memory to run your tasks | `number` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block of vpc | `string` | n/a | yes |
| <a name="input_waf_whitelist"></a> [waf\_whitelist](#input\_waf\_whitelist) | List IPs to ignore WAF check | `list(string)` | n/a | yes |
| <a name="input_x_alb_key"></a> [x\_alb\_key](#input\_x\_alb\_key) | ALB key to verify request from cloudfront to alb | `string` | n/a | yes |
| <a name="input_lambda_concurrency_threshold"></a> [lambda\_concurrency\_threshold](#input\_lambda\_concurrency\_threshold) | Lambda concurrent executions threshold to trigger alarm | `number` | `null` | no |
| <a name="input_notification_subscription_mails"></a> [notification\_subscription\_mails](#input\_notification\_subscription\_mails) | Subscription mails to receive notifications | `list(string)` | `null` | no |
| <a name="input_rds_connections_to_alarm"></a> [rds\_connections\_to\_alarm](#input\_rds\_connections\_to\_alarm) | number of RDS connections to alert | `number` | `null` | no |
| <a name="input_rds_cpu_to_alarm"></a> [rds\_cpu\_to\_alarm](#input\_rds\_cpu\_to\_alarm) | RDS CPU threshold to trigger alarm | `number` | `null` | no |
| <a name="input_rds_deadlocks_to_alarm"></a> [rds\_deadlocks\_to\_alarm](#input\_rds\_deadlocks\_to\_alarm) | Deadlocks duration to alert | `number` | `null` | no |
| <a name="input_rds_memory"></a> [rds\_memory](#input\_rds\_memory) | Memory of current RDS instance | `number` | `null` | no |
| <a name="input_rds_memory_to_alarm"></a> [rds\_memory\_to\_alarm](#input\_rds\_memory\_to\_alarm) | freeable memory threshold of RDS to alert | `number` | `null` | no |
| <a name="input_redis_cpu_threshold"></a> [redis\_cpu\_threshold](#input\_redis\_cpu\_threshold) | Redis CPU threshold to alert | `number` | `null` | no |
| <a name="input_redis_db_freeable_memory_threshold"></a> [redis\_db\_freeable\_memory\_threshold](#input\_redis\_db\_freeable\_memory\_threshold) | Freeable memory threshold to alert | `number` | `null` | no |
| <a name="input_redis_db_memory"></a> [redis\_db\_memory](#input\_redis\_db\_memory) | Memory of current redis instance | `number` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
