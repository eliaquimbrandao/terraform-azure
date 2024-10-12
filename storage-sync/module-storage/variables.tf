variable "storage_account_name" {
  description = "The name of the storage account."
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
