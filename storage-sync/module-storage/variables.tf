variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "account_tier" {
  description = "The performance tier of the storage account. Options: Standard, Premium."
  type        = string
}

variable "account_replication_type" {
  description = "The replication type of the storage account. Options: LRS, GRS, RAGRS, ZRS."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group."
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
