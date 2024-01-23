# cron-job

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
| <a name="module_batch"></a> [batch](#module\_batch) | ./batch | n/a |
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./ecr | n/a |
| <a name="module_event-bridge"></a> [event-bridge](#module\_event-bridge) | ./event-bridge | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cron_job_cpu"></a> [cron\_job\_cpu](#input\_cron\_job\_cpu) | n/a | `number` | n/a | yes |
| <a name="input_cron_job_memory"></a> [cron\_job\_memory](#input\_cron\_job\_memory) | n/a | `number` | n/a | yes |
| <a name="input_cron_job_schedule"></a> [cron\_job\_schedule](#input\_cron\_job\_schedule) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
