module "rg" {
  source   = "./module-rg"
  rg_name  = var.rg_name
  location = var.location
}

module "storage" {
  source               = "./module-storage"
  rg_name              = module.rg.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  file_share_name      = var.file_share_name
  file_share_quota     = var.file_share_quota
}

module "syncservice" {
  source                      = "./module-storage-sync-service"
  rg_name                     = module.rg.resource_group_name
  location                    = var.location
  storage_sync_name           = var.storage_sync_name
  sync_group_name             = var.sync_group_name
  storage_account_id          = module.storage.storage_account_id
  file_share_name             = module.storage.file_share_name
  storage_sync_cloud_endpoint = var.storage_sync_cloud_endpoint

}

module "server-endpoint" {
  source                     = "./module-server-endpoint"
  server_endpoint_name       = var.server_endpoint_name
  storage_sync_group_id      = module.syncservice.sync_group_id
  server_local_path          = var.server_local_path
  registered_server_id       = var.registered_server_id
  initial_download_policy    = var.initial_download_policy
  cloud_tiering_enabled      = var.cloud_tiering_enabled
  volume_free_space_percent  = var.volume_free_space_percent
  tier_files_older_than_days = var.tier_files_older_than_days
}
