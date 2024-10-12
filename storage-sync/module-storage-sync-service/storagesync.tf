# storage_sync.tf

resource "azurerm_storage_sync" "afssync" {
  name                = var.storage_sync_name
  resource_group_name = var.rg_name
  location            = var.location
}

resource "azurerm_storage_sync_group" "syncgroup" {
  name            = var.sync_group_name
  storage_sync_id = azurerm_storage_sync.afssync.id
}


