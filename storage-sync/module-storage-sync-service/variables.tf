variable "rg_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "storage_account_id" {
  description = "The ID of the storage account used by the sync service"
  type        = string
}

variable "file_share_name" {
  description = "The name of the Azure File Share used by the sync service"
  type        = string
}

variable "storage_sync_name" {
  description = "The name of the Azure File Sync service."
  type        = string
}

variable "sync_group_name" {
  description = "The name of the Sync Group."
  type        = string
}

variable "storage_sync_cloud_endpoint" {
  description = "The name of the server for the Server Endpoint."
  type        = string
}
