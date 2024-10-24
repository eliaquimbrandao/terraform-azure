resource "azurerm_storage_account" "stg" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.account_tier             # Options: "Standard", "Premium"
  account_replication_type = var.account_replication_type # Options:  "LRS" (Locally Redundant), "GRS" (Geo-Redundant), "RAGRS" (Read-Access Geo-Redundant), "ZRS" (Zone-Redundant)
}

resource "azurerm_storage_share" "fs" {
  name                 = var.file_share_name
  storage_account_name = azurerm_storage_account.stg.name
  quota                = var.file_share_quota
}
