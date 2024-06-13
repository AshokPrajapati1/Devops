# resource "azurerm_virtual_network_peering" "Peering-1" {
#     for_each = var.Peer
#   name                      = each.value.name
#   resource_group_name       = each.value.resource_group_name
#   virtual_network_name      = each.value.virtual_network_name
#   remote_virtual_network_id = data.azurerm_virtual_network.datapeer1[each.key].id
# }

# resource "azurerm_virtual_network_peering" "Peering-2" {
#     for_each = var.Peer2
#   name                      = each.value.name
#   resource_group_name       = each.value.resource_group_name
#   virtual_network_name      = each.value.virtual_network_name
#   remote_virtual_network_id = data.azurerm_virtual_network.datapeer2[each.key].id
# }