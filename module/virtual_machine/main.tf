data "azurerm_network_interface" "mahi08" {
  for_each            = var.nic_data
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault" "mahi11" {
  name                = "mykeyvaultdemo1239"
  resource_group_name = "mahi"
}
data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.mahi11.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.mahi11.id
}

resource "azurerm_linux_virtual_machine" "mahi07" {
  for_each                        = var.vm
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.vm_size
  admin_username                  = data.azurerm_key_vault_secret.username.value
  admin_password                  = data.azurerm_key_vault_secret.password.value
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids = [
    data.azurerm_network_interface.mahi08[each.key].id,
  ]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}
