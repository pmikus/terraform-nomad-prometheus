locals {
  artifact_source = join("",
    [
      "https://github.com/prometheus/prometheus/releases/download/",
      "v${var.job_prometheus_version}/",
      "prometheus-${var.job_prometheus_version}.linux-amd64.tar.gz"
    ]
  )
}

resource "nomad_job" "this" {
  jobspec = templatefile(
    "${path.module}/conf/nomad/prometheus.hcl.tftpl",
    {
      artifact_source          = local.artifact_source,
      artifact_source_checksum = var.job_artifact_source_checksum,
      auto_promote             = var.job_auto_promote,
      auto_revert              = var.job_auto_revert,
      canary                   = var.job_canary,
      cpu                      = var.job_cpu,
      constraint_value         = var.job_constraint_value,
      datacenters              = join(",", var.job_datacenters),
      group_count              = var.job_group_count,
      job_name                 = var.job_name,
      max_parallel             = var.job_max_parallel,
      memory                   = var.job_memory
      port                     = var.job_port,
      prometheus_version       = var.job_prometheus_version,
      region                   = var.job_region,
      service_name             = var.job_service_name,
      use_canary               = var.job_use_canary,
      use_host_volume          = var.job_use_host_volume,
      use_vault_provider       = var.job_vault_secret.use_vault_provider,
      vault_kv_policy_name     = var.job_vault_secret.vault_kv_policy_name,
      vault_kv_path            = var.job_vault_secret.vault_kv_path,
      volume_destination       = var.job_volume_destination,
      volume_source            = var.job_volume_source
  })
  detach = false
}
