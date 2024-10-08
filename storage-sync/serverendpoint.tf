
resource "azurerm_storage_sync_server_endpoint" "serverendpoint" {
  name                       = var.server_endpoint_name
  storage_sync_group_id      = azurerm_storage_sync_group.syncgroup.id
  registered_server_id       = var.registered_server_id # This is the server's unique registered ID
  server_local_path          = var.server_local_path
  initial_download_policy    = "NamespaceThenModifiedFiles"
  cloud_tiering_enabled      = true # Enable or disable cloud tiering
  volume_free_space_percent  = 20   # Set percentage of free space to maintain on the volume
  tier_files_older_than_days = 60   # Number of days after which files should be tiered (optional)
}
