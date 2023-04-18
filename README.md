<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |
| <a name="requirement_nomad"></a> [nomad](#requirement\_nomad) | >= 1.4.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nomad"></a> [nomad](#provider\_nomad) | >= 1.4.16 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [nomad_job.this](https://registry.terraform.io/providers/hashicorp/nomad/latest/docs/resources/job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_job_artifact_source_checksum"></a> [job\_artifact\_source\_checksum](#input\_job\_artifact\_source\_checksum) | Prometheus release checksum. | `string` | n/a | yes |
| <a name="input_job_auto_promote"></a> [job\_auto\_promote](#input\_job\_auto\_promote) | Specifies if the job should auto-promote to the canary version. | `bool` | `true` | no |
| <a name="input_job_auto_revert"></a> [job\_auto\_revert](#input\_job\_auto\_revert) | Specifies if the job should auto-revert to the last stable job. | `bool` | `true` | no |
| <a name="input_job_canary"></a> [job\_canary](#input\_job\_canary) | Equal to the count of the task group allows blue/green depl. | `number` | `1` | no |
| <a name="input_job_constraint_value"></a> [job\_constraint\_value](#input\_job\_constraint\_value) | The constraint allows restricting the set of eligible nodes. | `string` | `"compute"` | no |
| <a name="input_job_cpu"></a> [job\_cpu](#input\_job\_cpu) | CPU allocation. | `number` | `500` | no |
| <a name="input_job_datacenters"></a> [job\_datacenters](#input\_job\_datacenters) | Specifies the list of DCs to be considered placing this task. | `list(string)` | <pre>[<br>  "dc1"<br>]</pre> | no |
| <a name="input_job_group_count"></a> [job\_group\_count](#input\_job\_group\_count) | Specifies the number of the task groups running under this one. | `number` | `1` | no |
| <a name="input_job_max_parallel"></a> [job\_max\_parallel](#input\_job\_max\_parallel) | Specifies the maximum number of updates to perform in parallel. | `number` | `1` | no |
| <a name="input_job_memory"></a> [job\_memory](#input\_job\_memory) | Specifies the memory required in MB. | `number` | `256` | no |
| <a name="input_job_name"></a> [job\_name](#input\_job\_name) | Specifies a name for the job. | `string` | `"prometheus"` | no |
| <a name="input_job_port"></a> [job\_port](#input\_job\_port) | Specifies the static TCP/UDP port to allocate. | `number` | `9090` | no |
| <a name="input_job_prometheus_version"></a> [job\_prometheus\_version](#input\_job\_prometheus\_version) | Prometheus version | `string` | n/a | yes |
| <a name="input_job_region"></a> [job\_region](#input\_job\_region) | Specifies the region in which to execute the job. | `string` | `"global"` | no |
| <a name="input_job_service_name"></a> [job\_service\_name](#input\_job\_service\_name) | Specifies the name this service will be advertised in Consul. | `string` | `"prometheus"` | no |
| <a name="input_job_use_canary"></a> [job\_use\_canary](#input\_job\_use\_canary) | Uses canary deployment. | `bool` | `true` | no |
| <a name="input_job_use_host_volume"></a> [job\_use\_host\_volume](#input\_job\_use\_host\_volume) | Use Nomad host volume feature. | `bool` | `false` | no |
| <a name="input_job_vault_secret"></a> [job\_vault\_secret](#input\_job\_vault\_secret) | Set of properties to be able to fetch secret from vault. | <pre>object({<br>    use_vault_provider   = bool,<br>    vault_kv_policy_name = string<br>    vault_kv_path        = string<br>  })</pre> | <pre>{<br>  "use_vault_provider": true,<br>  "vault_kv_path": "pki/issue/consul",<br>  "vault_kv_policy_name": "nomad-cluster"<br>}</pre> | no |
| <a name="input_job_volume_destination"></a> [job\_volume\_destination](#input\_job\_volume\_destination) | Specifies where the volume should be mounted inside the task | `string` | `"/local/"` | no |
| <a name="input_job_volume_source"></a> [job\_volume\_source](#input\_job\_volume\_source) | The name of the volume to request | `string` | `"volume-prometheus"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->