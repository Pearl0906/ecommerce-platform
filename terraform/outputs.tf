output "catalog_name" {
  description = "Existing Databricks catalog used by the project"
  value       = local.catalog_name
}

output "schemas" {
  description = "Schemas created by Terraform"
  value = {
    for name, schema in module.schema :
    name => schema.schema_name
  }
}

output "raw_volume_name" {
  description = "Managed volume containing the raw CSV files"
  value       = module.volume.volume_name
}

output "raw_volume_path" {
  description = "Path of the managed raw data volume"
  value       = module.volume.volume_path
}