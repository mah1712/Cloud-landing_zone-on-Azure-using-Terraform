module "rgs" {
  source = "../../module/rg"
  rgs    = var.azurerm_resource_group
}

module "vnet" {
    depends_on = [ module.rgs ]
  source = "../../module/Vnet"
  vnet = var.vnets
  }

module "pip" {
  depends_on = [ module.rgs ]
  source = "../../module/pip"
  pip = var.pips
}

module "nic" {
    depends_on = [ module.vnet ]
    source = "../../module/nic"
    nic = var.nic
    subnet_data = var.subnet_data
  
}
module "vm" {
    depends_on = [ module.nic ,module.kv ]
    source = "../../module/vm"
    vm = var.vm
    nic_data = var.nic_data
    data_kv = var.data_kv
  
}
module "kv" {
    depends_on = [ module.rgs ]
    source = "../../module/keyvault"
  }