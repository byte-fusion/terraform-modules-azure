resource "azurerm_virtual_network" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.region
  address_space       = var.address_spaces
  tags                = var.tags
}

resource "azurerm_subnet" "subnets" {
  for_each = {
    for subnet in var.subnets :
    subnet.name => subnet
  }
  name                 = each.value.name
  resource_group_name  = azurerm_virtual_network.this.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.address_prefixes
}