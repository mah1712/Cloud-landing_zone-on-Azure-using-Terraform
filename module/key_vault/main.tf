resource "azurerm_key_vault" "kv" {
  name                        = "xxxxxxx" # must be globally unique
  location                    = "xxxxxxx"
  resource_group_name         = "xxxx"
  tenant_id                   = "xxxxxxx"
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
  value        = "xxxxxx"
  key_vault_id = azurerm_key_vault.kv.id
}

# Get current identity
data "azurerm_client_config" "current" {}


resource "azurerm_key_vault_access_policy" "terraform" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = "xxxxxxx"
  object_id    = "xxxxxxxxxx"

  secret_permissions = ["Get", "List", "Set", "Delete", "Purge"]
}
