
variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "rg_name" {
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

variable "initial_download_policy" {
  description = "The initial download policy for the server endpoint."
  type        = string
}

variable "cloud_tiering_enabled" {
  description = "Whether to enable cloud tiering for the server endpoint."
  type        = bool
}

variable "volume_free_space_percent" {
  description = "The percentage of free space to maintain on the volume."
  type        = number
}

variable "tier_files_older_than_days" {
  description = "The number of days after which files should be tiered."
  type        = number
}
