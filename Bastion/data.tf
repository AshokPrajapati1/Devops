

data "azurerm_public_ip" "data-pip" {
    for_each = var.BS
  name                = each.value.name2
  resource_group_name = each.value.resource_group_name
}


