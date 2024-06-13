data "azurerm_network_interface" "DataNIC-1" {
    for_each = var.LB
  name                =each.value.name6
  resource_group_name =each.value.resource_group_name
}

data "azurerm_network_interface" "DataNIC-2" {
    for_each = var.LB
  name                =each.value.name7
  resource_group_name =each.value.resource_group_name
}
