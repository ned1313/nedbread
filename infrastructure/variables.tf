variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-nedbread"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources"
  default     = "westus2"
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

variable "dns_zone_name" {
  type        = string
  description = "Domain name for the DNS zone"
  default     = "nedbread.com"
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure subscription ID"
  
}