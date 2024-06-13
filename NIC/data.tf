data "azurerm_subnet" "Data-sub" {
    for_each = var.NIC
  name                 =each.value.name2
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
