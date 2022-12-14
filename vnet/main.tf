resource "azurerm_virtual_network" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.region
  address_space       = var.address_spaces
}

resource "azurerm_subnet" "subnets" {
  for_each = {
    for subnet in var.subnets :
    subnet.name => subnet
  }
  name = each.value.name
  #name                 = element(var.subnets.*.name, count.index)
  resource_group_name  = azurerm_virtual_network.this.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.address_prefixes
  #address_prefixes     = element(var.subnets.*.address_prefixes, count.index)
}