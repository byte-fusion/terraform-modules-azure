# Create a public DNS zone
resource "azurerm_dns_zone" "this" {
  count = var.private_dns_enable == false ? 1 : 0

  name                = var.zone_name
  resource_group_name = var.resource_group_name

  tags = var.tags
}

# Create a private DNS zone
resource "azurerm_private_dns_zone" "this" {
  count = var.private_dns_enable == true ? 1 : 0

  name                = var.zone_name
  resource_group_name = var.resource_group_name

  tags = var.tags
}
