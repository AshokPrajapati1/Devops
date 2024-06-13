

resource "azurerm_key_vault" "Yash_Key" {
    for_each = var.KV
  name                       = each.value.name
  location                   = each.value.location
  resource_group_name        = each.value.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = each.value.sku_name
  soft_delete_retention_days = each.value.soft_delete_retention_days

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "List",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}


resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
resource "azurerm_key_vault_secret" "username" {
    for_each = var.KV
  name         = "secretuser"
  value        = "virat"
  key_vault_id = azurerm_key_vault.Yash_Key[each.key].id
}
resource "azurerm_key_vault_secret" "password" {
    for_each = var.KV
  name         = "secretpassword"
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.Yash_Key[each.key].id
}