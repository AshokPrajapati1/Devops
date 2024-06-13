RG = {
  RG1 = {
    name     = "Yash"
    location = "West Europe"

  }
}

Vnet = {
  Vnet1 = {
    name                = "Yash-network"
    address_space       = ["10.1.0.0/16"]
    location            = "West Europe"
    resource_group_name = "Yash"
  }

}



Sub = {
  Sub1 = {
    name                 = "Frontend"
    resource_group_name  = "Yash"
    virtual_network_name = "Yash-network"
    address_prefixes     = ["10.1.2.0/24"]
  }
  Sub2 = {
    name                 = "Backend"
    resource_group_name  = "Yash"
    virtual_network_name = "Yash-network"
    address_prefixes     = ["10.1.3.0/24"]
  }

}


NIC = {


  NIC1 = {

    name                          = "Yash-nic"
    location                      = "West Europe"
    resource_group_name           = "Yash"
    name1                         = "internal"
    private_ip_address_allocation = "Dynamic"
    name2                         = "Frontend"
    virtual_network_name          = "Yash-network"

  }

  NIC2 = {

    name                          = "Mayank-nic"
    location                      = "West Europe"
    resource_group_name           = "Yash"
    name1                         = "internal"
    private_ip_address_allocation = "Dynamic"
    name2                         = "Backend"
    virtual_network_name          = "Yash-network"

  }
}

PIP = {

  PIP1 = {

    name                = "Yash-PublicIP"
    location            = "West Europe"
    resource_group_name = "Yash"
    allocation_method   = "Static"
    sku                 = "Standard"


  }
}

VM = {

  VM1 = {

    name                = "Yash-machine1"
    resource_group_name = "Yash"
    location            = "West Europe"
    size                = "Standard_F2"
    # admin_username       = "adminuser"
    # admin_password       = "India@#12345"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    name1                = "Yash-nic"
    name2                = "Mayank-Key"
    name3                = "secretuser"
    name4                = "secretpassword"
  }

  VM2 = {

    name                = "Mayank-machine"
    resource_group_name = "Yash"
    location            = "West Europe"
    size                = "Standard_F2"
    # admin_username       = "adminuser"
    # admin_password       = "India@#12345"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    name1                = "Mayank-nic"
    name2                = "Mayank-Key"
    name3                = "secretuser"
    name4                = "secretpassword"
  }
}


BS = {


  BS1 = {
    name                 = "Yash-Bastion"
    location             = "West Europe"
    resource_group_name  = "Yash"
    ip_name              = "configuration"
    name1                = "AzureBastionSubnet"
    virtual_network_name = "Yash-network"
    resource_group_name  = "Yash"
    name2                = "Yash-PublicIP"
    address_prefixes     = ["10.1.0.0/26"]
  }
}




# Peer={

# Peer1={
#  name                     = "peer1to2"
#   resource_group_name       = "Yash"
#   virtual_network_name      = "Mayank-network"
#  remote_virtual_network      = "Yash-network"

# }}

# Peer2={

#   Peer3={
#  name                     = "peer2to1"
#   resource_group_name       = "Yash"
#   virtual_network_name      = "Yash-network"
#  remote_virtual_network       = "Mayank-network"

# # }


# }


KV = {


  KV1 = {

    name                       = "Mayank-Key"
    location                   = "West Europe"
    resource_group_name        = "yash"
    sku_name                   = "premium"
    soft_delete_retention_days = 7


  }
}




LB = {

  LB1 = {
    name                = "Ashoklbpublic"
    location            = "West Europe"
    resource_group_name = "Yash"
    allocation_method   = "Static"
    name1               = "AshokLoadBalancer"
    location            = "West Europe"
    resource_group_name = "Yash"
    name2               = "AshokPublicIPAddress"
    name3               = "AshokBackEndAddressPool"

    name4    = "LBRule"
    protocol = "Tcp"

    frontend_ip_configuration_name = "AshokPublicIPAddress"

    name5                 = "ssh-running-probe"
    name6                 = "Yash-nic"
    name7                 = "Mayank-nic"
    ip_configuration_name = "internal"

  }
}





