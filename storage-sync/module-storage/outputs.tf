output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.stg.name
}

output "storage_account_id" {
  description = "The ID of the storage account"
  value       = azurerm_storage_account.stg.id
}

output "file_share_name" {
  description = "The name of the Azure File Share"
  value       = azurerm_storage_share.fs.name
}
