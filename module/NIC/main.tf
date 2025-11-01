data "azurerm_subnet" "mahi06" {
    for_each = var.subnet_data
  name                 = each.value.data_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_network_interface" "mahi05" {
    for_each = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each =  each.value.ip_configuration
    content {
    name                          = ip_configuration.value.ip_name
    subnet_id                     = data.azurerm_subnet.mahi06[each.key].id
    private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    }

  }
}
