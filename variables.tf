variable "name_strings" {
  description = "a list of strings to concatenate into a name - useful when templating a naming convention"
  type        = list(string)
}

variable "location" {
  description = "the location in which to deploy the resources"
  type        = string
}

variable "resource_group_name" {
  description = "the name of the resource group to place the resource in"
  type        = string
}

variable "account_tier" {
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created"
  type        = string
  default     = "Standard"

  validation {
    condition     = var.account_tier == "Standard" || var.account_tier == "Premium"
    error_message = "Valid options are Standard, Premium."
  }
}

variable "account_kind" {
  description = "(Optional) Defines the Kind of account."
  type        = string
  default     = "StorageV2"

  validation {
    condition     = var.account_kind == "BlobStorage" || var.account_kind == "BlockBlobStorage" || var.account_kind == "FileStorage" || var.account_kind == "Storage" || var.account_kind == "StorageV2"
    error_message = "Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
  }
}

variable "account_replication_type" {
  description = "(Required) Defines the type of replication to use for this storage account."
  type        = string
  default     = "LRS"

  validation {
    condition     = var.account_replication_type == "LRS" || var.account_replication_type == "GRS" || var.account_replication_type == "RAGRS" || var.account_replication_type == "ZRS" || var.account_replication_type == "GZRS" || var.account_replication_type == "RAGZRS"
    error_message = "Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  }
}

variable "enable_https_traffic_only" {
  description = "(Optional) Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true."
  type        = string
  default     = "true"

  validation {
    condition     = var.enable_https_traffic_only == "true" || var.enable_https_traffic_only == "false"
    error_message = "This is a Boolean."
  }
}

variable "tags" {
  type        = map(any)
  description = "(Optional) A map of tags to assign to the resource."
  default     = {}
}

variable "allow_blob_public_access" {
  description = "Allow or disallow public access to all blobs or containers in the storage account."
  type        = string
  default     = "false"

  validation {
    condition     = var.allow_blob_public_access == "true" || var.allow_blob_public_access == "false"
    error_message = "This is a boolean."
  }
}
