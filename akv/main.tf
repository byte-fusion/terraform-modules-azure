resource "random_string" "random" {
  count = var.randomize_name_suffix == true ? 1 : 0

  length            = 5
  upper             = false
  special           = false
}

locals {
  suffix = var.randomize_name_suffix == true ? format("%s%s", "-", random_string.random[0].result) : ""
  final_name = format("%s%s", var.name, local.suffix)
}

resource "azurerm_key_vault" "this" {
  name                        = local.final_name
  location                    = var.region
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = var.disk_encryption_access_enabled
  enabled_for_deployment      = var.vm_access_enabled
  tenant_id                   = data.azurerm_client_config.current.tenant_id 
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  sku_name                    = var.sku_name
  enable_rbac_authorization   = var.enable_rbac
}

resource "azurerm_role_assignment" "this" {
  count = var.enable_rbac == true ? 1 : 0

  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_key_vault_access_policy" "this" {
  count = var.enable_rbac == false ? 1 : 0

  key_vault_id            = azurerm_key_vault.this.id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = data.azurerm_client_config.current.object_id

  certificate_permissions = var.certificate_permissions
  key_permissions         = var.key_permissions
  secret_permissions      = var.secret_permissions
}
