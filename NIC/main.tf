resource "azurerm_network_interface" "MyNIC" {
    for_each = var.NIC
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.name1
    subnet_id                     = data.azurerm_subnet.Data-sub[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}


