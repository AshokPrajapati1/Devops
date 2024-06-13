resource "azurerm_public_ip" "lbpip" {
    for_each = var.LB
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku = "Standard"
}

resource "azurerm_lb" "MyLB" {
    for_each = var.LB
  name                = each.value.name1
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
 sku = "Standard"
  frontend_ip_configuration {
    name                 = each.value.name2
    public_ip_address_id = azurerm_public_ip.lbpip[each.key].id
  }
}


resource "azurerm_lb_backend_address_pool" "Myaddresslb" {
    for_each = var.LB
  loadbalancer_id = azurerm_lb.MyLB[each.key].id
  name            = each.value.name3
}


resource "azurerm_lb_rule" "Mylbrule" {
    for_each = var.LB
  loadbalancer_id                = azurerm_lb.MyLB[each.key].id
  name                           = each.value.name4
  protocol                       = each.value.protocol
  frontend_port                  =80
  backend_port                   = 80
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
probe_id = azurerm_lb_probe.Mylbprobe[each.key].id
backend_address_pool_ids = [azurerm_lb_backend_address_pool.Myaddresslb[each.key].id]
}



resource "azurerm_lb_probe" "Mylbprobe" {
    for_each = var.LB
  loadbalancer_id = azurerm_lb.MyLB[each.key].id
  name            = each.value.name5
  port            = 80
}



resource "azurerm_network_interface_backend_address_pool_association" "NICpool-1" {
    for_each = var.LB
  network_interface_id    = data.azurerm_network_interface.DataNIC-1[each.key].id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.Myaddresslb[each.key].id
}


resource "azurerm_network_interface_backend_address_pool_association" "NICpool-2" {
    for_each = var.LB
  network_interface_id    = data.azurerm_network_interface.DataNIC-2[each.key].id
  ip_configuration_name   =each.value.ip_configuration_name
  backend_address_pool_id =  azurerm_lb_backend_address_pool.Myaddresslb[each.key].id
}