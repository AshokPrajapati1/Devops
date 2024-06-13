# data "azurerm_virtual_network" "datapeer1" {
#     for_each = var.Peer
#   name                = each.value.remote_virtual_network
#   resource_group_name = each.value.resource_group_name
# }

# data "azurerm_virtual_network" "datapeer2" {
#     for_each = var.Peer2
#   name                = each.value.remote_virtual_network
#   resource_group_name = each.value.resource_group_name
# }