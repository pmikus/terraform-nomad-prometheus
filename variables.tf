variable "job_artifact_source_checksum" {
  description = "Prometheus release checksum."
  type        = string
}

variable "job_auto_promote" {
  default     = true
  description = "Specifies if the job should auto-promote to the canary version."
  type        = bool
}

variable "job_auto_revert" {
  default     = true
  description = "Specifies if the job should auto-revert to the last stable job."
  type        = bool
}

variable "job_canary" {
  default     = 1
  description = "Equal to the count of the task group allows blue/green depl."
  type        = number
}

variable "job_cpu" {
  default     = 500
  description = "CPU allocation."
  type        = number
}

variable "job_constraint_value" {
  default     = "compute"
  description = "The constraint allows restricting the set of eligible nodes."
  type        = string
}

variable "job_datacenters" {
  default     = ["dc1"]
  description = "Specifies the list of DCs to be considered placing this task."
  type        = list(string)
}

variable "job_group_count" {
  default     = 1
  description = "Specifies the number of the task groups running under this one."
  type        = number
}

variable "job_name" {
  default     = "prometheus"
  description = "Specifies a name for the job."
  type        = string
}

variable "job_max_parallel" {
  default     = 1
  description = "Specifies the maximum number of updates to perform in parallel."
  type        = number
}

variable "job_memory" {
  default     = 256
  description = "Specifies the memory required in MB."
  type        = number
}

variable "job_port" {
  default     = 9090
  description = "Specifies the static TCP/UDP port to allocate."
  type        = number
}

variable "job_prometheus_version" {
  description = "Prometheus version"
  type        = string
}

variable "job_region" {
  default     = "global"
  description = "Specifies the region in which to execute the job."
  type        = string
}

variable "job_service_name" {
  default     = "prometheus"
  description = "Specifies the name this service will be advertised in Consul."
  type        = string
}

variable "job_use_canary" {
  default     = true
  description = "Uses canary deployment."
  type        = bool
}

variable "job_use_host_volume" {
  default     = false
  description = "Use Nomad host volume feature."
  type        = bool
}

variable "job_vault_secret" {
  type = object({
    use_vault_provider   = bool,
    vault_kv_policy_name = string
    vault_kv_path        = string
  })
  description = "Set of properties to be able to fetch secret from vault."
  default = {
    use_vault_provider   = true
    vault_kv_policy_name = "nomad-cluster"
    vault_kv_path        = "pki/issue/consul"
  }
}

variable "job_volume_destination" {
  default     = "/local/"
  description = "Specifies where the volume should be mounted inside the task"
  type        = string
}

variable "job_volume_source" {
  default     = "volume-prometheus"
  description = "The name of the volume to request"
  type        = string
}
