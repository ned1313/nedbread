variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-nedbread"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources"
  default     = "eastus"
}

variable "static_site_name" {
  type        = string
  description = "Name of the static website"
  default     = "nedbread"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "production"
}
