output "dns_zone_id" {
  description = "DNS Zone ID"
  value       = (var.private_dns_enable) ? azurerm_private_dns_zone.this[0].id : azurerm_dns_zone.this[0].id
}

output "dns_zone_name" {
  description = "DNS Zone Name"
  value       = var.zone_name
}
