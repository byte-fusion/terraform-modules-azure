# data "azurerm_virtual_network" "infra" {
#   name                = var.default_node_pool.vnet_name
#   resource_group_name = var.resource_group_name
# }

# data "azurerm_subnet" "infra" {
#   for_each             = data.azurerm_virtual_network.infra.subnets
#   name                 = each.value.name
#   virtual_network_name = var.default_node_pool.vnet_name
#   resource_group_name  = var.resource_group_name
# }