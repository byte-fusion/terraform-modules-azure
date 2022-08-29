output "key_vault_id" {
  description = "The ID of Azure Key Vault"
  value       = azurerm_key_vault.this.id
}

output "key_vault_name" {
  description = "The Name of Azure Key Vault"
  value       = azurerm_key_vault.this.name
}

output "key_vault_tenant_id" {
  description = "Tenant ID of Azure Key Vault"
  value       = azurerm_key_vault.this.tenant_id
}
