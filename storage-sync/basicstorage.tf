
# storage_account.tf

resource "azurerm_storage_account" "stg" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard" # Options: "Standard", "Premium"
  account_replication_type = "LRS"      # Options:  "LRS" (Locally Redundant), "GRS" (Geo-Redundant), "RAGRS" (Read-Access Geo-Redundant), "ZRS" (Zone-Redundant)
}

resource "azurerm_storage_share" "fs" {
  name                 = var.file_share_name
  storage_account_name = azurerm_storage_account.stg.name
  quota                = var.file_share_quota
}
