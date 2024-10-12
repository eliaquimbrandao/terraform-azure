output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.rg.resource_group_name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = module.storage.storage_account_name
}

output "storage_sync_name" {
  description = "The name of the Storage Sync Service"
  value       = module.syncservice.storage_sync
}

output "sync_group_name" {
  description = "The name of the Storage Sync Group"
  value       = module.syncservice.storage_sync_group
}

output "storage_sync_cloud_endpoint" {
  description = "The name of the Cloud Endpoint"
  value       = module.syncservice.storage_sync_cloud_endpoint
}

output "storage_sync_server_endpoint" {
  description = "The name of the Server Endpoint"
  value       = module.server-endpoint.azurerm_storage_sync_server_endpoint
}

