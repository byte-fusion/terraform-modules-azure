output key_vault_id {
  description = "The ID of Azure Key Vault"
  value       = azurerm_key_vault.this.id
}

output key_vault_name {
  description = "The Name of Azure Key Vault"
  value       = azurerm_key_vault.this.name
}

output key_vault_tenant_id {
  description = "Tenant ID of Azure Key Vault"
  value       = azurerm_key_vault.this.tenant_id
}

output key_vault_managed_identity {
  description = "Managed Identity of Azure Key Vault"
  value       = azurerm_user_assigned_identity.this.*
}

output debug_key_vault {
  description = "Debug Azure Key Vault"
  value       = azurerm_key_vault.this.*
}

output debug_key_vault_access_policies {
  description = "Debug Access Policies of Azure Key Vault"
  value       = azurerm_key_vault_access_policy.this.*
}

output debug_randomize_name_suffix {
  description = "Tenant ID of Azure Key Vault"
  value       = var.randomize_name_suffix
}

