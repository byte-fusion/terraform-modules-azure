output "nat_gateway_id" {
  description = "The ID of NAT Gateway"
  value       = azurerm_nat_gateway.this.id
}

output "nat_gateway_name" {
  description = "The Name of the Virtual Network"
  value       = azurerm_nat_gateway.this.name
}

output "nat_gateway_ip" {
  description = "The Name of the Virtual Network"
  value       = azurerm_public_ip.this
}
