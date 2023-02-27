output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.this.id
}

output "vnet" {
  description = "The Name of the Virtual Network"
  value       = azurerm_virtual_network.this
}

output "vnet_name" {
  description = "The Name of the Virtual Network"
  value       = azurerm_virtual_network.this.name
}

output "vnet_subnet_names" {
  description = "The Virtual Network Subnets" #TODO Is there a better way to output this value?
  value       = { for k, v in azurerm_subnet.subnets : k => v.id }
}

output "vnet_subnets" {
  description = "The Virtual Network Subnets" #TODO Is there a better way to output this value?
  value       = azurerm_subnet.subnets
}