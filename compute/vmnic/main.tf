resource "azurerm_public_ip" "this" {
  count               = (var.public_ip_enable == true) ? 1 : 0
  name                = var.name
  resource_group_name = var.region
  location            = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method

  tags = var.tags
}

resource "azurerm_network_interface" "this" {
  name                = var.name
  location            = var.region
  resource_group_name = var.resource_group_name

  ip_configuration {
    # name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = (var.public_ip_enable == true) ? azurerm_public_ip.this[0].id : null
  }

  tags = var.tags
}