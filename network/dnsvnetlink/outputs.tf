output "dns_vnet_link_id" {
  description = "DNS VNET Link ID"
  value       = azurerm_private_dns_zone_virtual_network_link.this.id 
}
