# outputs.tf
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.stg.name
}

output "sync_group_name" {
  description = "The name of the Storage Sync Service"
  value       = azurerm_storage_sync_group.syncgroup.name
}
output "azurerm_storage_sync" {
  description = "The name of the Storage Sync Service"
  value       = azurerm_storage_sync.afssync.name
}

output "azurerm_storage_sync_cloud_endpoint" {
  description = "The name of the Storage Sync Service"
  value       = azurerm_storage_sync_cloud_endpoint.cloudshare.name
}

output "azurerm_storage_sync_server_endpoint" {
  description = "The name of the Storage Sync Service"
  value       = azurerm_storage_sync_server_endpoint.serverendpoint.name
}

