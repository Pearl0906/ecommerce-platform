module "schema" {
  source = "./modules/schema"

  for_each = local.schema

  catalog_name = local.catalog_name
  schema_name  = each.key
  comment      = each.value.comment
}

module "volume" {
  source = "./modules/volume"

  catalog_name = local.catalog_name
  schema_name  = "bronze"
  volume_name  = var.volume_name
  comment      = "Managed volume containing the five raw marketing and e-commerce CSV datasets"

  depends_on = [module.schema]
}

module "permissions" {
  source = "./modules/permissions"

  catalog_name       = local.catalog_name
  schema_names       = var.schema_names
  volume_schema_name = "bronze"
  volume_name        = var.volume_name
  principal          = var.permission_principal

  depends_on = [
    module.schema,
    module.volume
  ]
}