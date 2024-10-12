resource "azurerm_storage_sync_cloud_endpoint" "cloudshare" {
  name                  = var.storage_sync_cloud_endpoint
  storage_sync_group_id = azurerm_storage_sync_group.syncgroup.id
  storage_account_id    = var.storage_account_id
  file_share_name       = var.file_share_name
}
