
resource "azurerm_storage_sync_server_endpoint" "serverendpoint" {
  name                       = var.server_endpoint_name
  storage_sync_group_id      = var.storage_sync_group_id
  registered_server_id       = var.registered_server_id
  server_local_path          = var.server_local_path
  initial_download_policy    = var.initial_download_policy    # "NamespaceThenModifiedFiles"
  cloud_tiering_enabled      = var.cloud_tiering_enabled      # Enable or disable cloud tiering
  volume_free_space_percent  = var.volume_free_space_percent  # Set percentage of free space to maintain on the volume
  tier_files_older_than_days = var.tier_files_older_than_days # Number of days after which files should be tiered (optional)
}
