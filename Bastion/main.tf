resource "azurerm_subnet" "MySubnet" {
    for_each = var.BS
  name                 = each.value.name1
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     =each.value.address_prefixes
}



resource "azurerm_bastion_host" "MYBS" {
    for_each = var.BS
  name                = each.value.name
  location            =each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 =each.value.ip_name
    subnet_id            = azurerm_subnet.MySubnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.data-pip[each.key].id
}
}