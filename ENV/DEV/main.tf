module "resource" {
  source = "../../RG"
  RG     = var.RG
}

module "Virtual_network" {
  source     = "../../Vnet"
  Vnet       = var.Vnet
  depends_on = [module.resource]
}

module "Subnet" {
  source     = "../../Subnet"
  Sub        = var.Sub
  depends_on = [module.Virtual_network]
}

module "Network" {
  source = "../../NIC"
  NIC    = var.NIC

  depends_on = [module.Subnet]
}

module "Public_ip" {
  source     = "../../Public"
  PIP        = var.PIP
  depends_on = [module.Network]

}

module "Virtual_Machine" {
  source     = "../../VM"
  VM         = var.VM
  depends_on = [module.key_vault_id]

}

module "Bastion_host" {
  source     = "../../Bastion"
  BS         = var.BS
  depends_on = [module.Virtual_Machine]

}

# module "Peering" {

#   source = "../../Peering"
#   Peer =var.Peer
#   Peer2 = var.Peer2
#   depends_on = [module.Virtual_Machine ]

# }

module "key_vault_id" {
  source     = "../../Key_vault"
  KV         = var.KV
  depends_on = [module.resource]

}


module "Load" {
  source = "../../LB"
  LB     = var.LB

  depends_on = [module.Network]
}