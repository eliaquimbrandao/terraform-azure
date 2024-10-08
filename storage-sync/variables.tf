# variables.tf

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "file_share_name" {
  description = "The name of the Azure File Share."
  type        = string
}

variable "file_share_quota" {
  description = "The quota of the Azure File Share in GB."
  type        = number
  default     = 102400
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

variable "registered_server_id" {
  description = "The ID of the registered server for Azure File Sync."
  type        = string
}

variable "server_endpoint_name" {
  description = "The name of the server endpoint."
  type        = string
}

variable "server_local_path" {
  description = "The local path on the server to sync."
  type        = string
}


