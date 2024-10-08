
resource "azurerm_storage_sync_cloud_endpoint" "cloudshare" {
  name                  = var.storage_sync_cloud_endpoint
  storage_sync_group_id = azurerm_storage_sync_group.syncgroup.id
  storage_account_id    = azurerm_storage_account.stg.id
  file_share_name       = azurerm_storage_share.fs.name
}
