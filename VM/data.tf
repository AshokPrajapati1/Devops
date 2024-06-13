data "azurerm_network_interface" "data-nic" {
    for_each = var.VM
  name                = each.value.name1
  resource_group_name =each.value.resource_group_name
}



data "azurerm_key_vault" "Kuchbhi" {
  for_each = var.VM
  name                = each.value.name2
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "username" {
  for_each = var.VM
  name         = each.value.name3
  key_vault_id = data.azurerm_key_vault.Kuchbhi[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each = var.VM
  name         = each.value.name4
  key_vault_id = data.azurerm_key_vault.Kuchbhi[each.key].id
}