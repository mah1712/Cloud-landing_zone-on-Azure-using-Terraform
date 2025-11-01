resource "azurerm_key_vault" "kv" {
  name                        = "mykeyvaultdemo12398" # must be globally unique
  location                    = "centralindia"
  resource_group_name         = "mahi"
  tenant_id                   = "7d0abf88-f021-4498-a086-2ceb7a18b4e7"
  sku_name                    = "standard"

  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
}

# Store username as secret
resource "azurerm_key_vault_secret" "admin_user" {
  name         = "username"
  value        = "azureuser"
  key_vault_id = azurerm_key_vault.kv.id
}

# Store password as secret
resource "azurerm_key_vault_secret" "admin_pass" {
  name         = "password"
  value        = "mahi@12345"
  key_vault_id = azurerm_key_vault.kv.id
}

# Get current identity
data "azurerm_client_config" "current" {}


resource "azurerm_key_vault_access_policy" "terraform" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = "7d0abf88-f021-4498-a086-2ceb7a18b4e7"
  object_id    = "8467129a-8db5-4a83-b275-95bc63c6e2ac"

  secret_permissions = ["Get", "List", "Set", "Delete", "Purge"]
}
