output "storage_sync" {
  description = "The name of the Storage Sync Service"
  value       = azurerm_storage_sync.afssync.name
}

output "storage_sync_group" {
  description = "The name of the Sync Group"
  value       = azurerm_storage_sync_group.syncgroup.name
}

output "sync_group_id" {
  description = "The ID of the Sync Group"
  value       = azurerm_storage_sync_group.syncgroup.id
}

output "storage_sync_cloud_endpoint" {
  description = "The name of the Storage Sync Service"
  value       = azurerm_storage_sync_cloud_endpoint.cloudshare.name
}

