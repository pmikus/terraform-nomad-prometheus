# Nomad
variable "datacenters" {
  description = "Specifies the list of DCs to be considered placing this task"
  type        = list(string)
  default     = ["dc1"]
}

variable "region" {
  description = "Specifies the list of DCs to be considered placing this task"
  type        = string
  default     = "global"
}

variable "volume_source" {
  description = "The name of the volume to request"
  type        = string
  default     = "volume-prometheus"
}

# Prometheus
variable "auto_promote" {
  description = "Specifies if the job should auto-promote to the canary version"
  type        = bool
  default     = true
}

variable "auto_revert" {
  description = "Specifies if the job should auto-revert to the last stable job"
  type        = bool
  default     = true
}

variable "canary" {
  description = "Equal to the count of the task group allows blue/green depl."
  type        = number
  default     = 1
}

variable "cpu" {
  description = "CPU allocation"
  type        = number
  default     = 500
}

variable "constraint_value" {
  description = "The constraint allows restricting the set of eligible nodes."
  type        = string
  default     = "compute"
}

variable "data_dir" {
  description = "Prometheus DISK allocation"
  type        = string
  default     = "/data"
}

variable "group_count" {
  description = "Specifies the number of the task groups running under this one"
  type        = number
  default     = 1
}

variable "job_name" {
  description = "Specifies a name for the job"
  type        = string
  default     = "prometheus"
}

variable "max_parallel" {
  description = "Specifies the maximum number of updates to perform in parallel"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Specifies the memory required in MB"
  type        = number
  default     = 256
}

variable "port" {
  description = "Specifies the static TCP/UDP port to allocate"
  type        = number
  default     = 9090
}

variable "service_name" {
  description = "Specifies the name this service will be advertised in Consul"
  type        = string
  default     = "prometheus"
}

variable "use_canary" {
  description = "Uses canary deployment"
  type        = bool
  default     = true
}

variable "use_host_volume" {
  description = "Use Nomad host volume feature"
  type        = bool
  default     = false
}

variable "pm_version" {
  description = "Prometheus version"
  type        = string
  default     = "2.41.0"
}

variable "artifact_source_checksum" {
  description = "Prometheus release checksum"
  type        = string
  default     = "9c1486f5f3e03d56433112594740ca84c6e59db061d096eeb3ea971ba25441c9"
}

variable "volume_destination" {
  description = "Specifies where the volume should be mounted inside the task"
  type        = string
  default     = "/local/"
}

variable "vault_secret" {
  type = object({
    use_vault_provider        = bool,
    vault_kv_policy_name      = string,
    vault_kv_path             = string,
    vault_kv_field_access_key = string,
    vault_kv_field_secret_key = string
  })
  description = "Set of properties to be able to fetch secret from vault."
  default = {
    use_vault_provider        = false
    vault_kv_policy_name      = "kv"
    vault_kv_path             = "secret/data/prometheus"
    vault_kv_field_access_key = "access_key"
    vault_kv_field_secret_key = "secret_key"
  }
}
