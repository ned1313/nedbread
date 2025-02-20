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

variable "dns_zone_name" {
  type        = string
  description = "Domain name for the DNS zone"
  default     = "nedbread.com"
}

variable "repository_branch" {
  type        = string
  description = "Branch of the repository to deploy"
  default     = "main"
}

variable "repository_token" {
  type        = string
  description = "Personal access token for the repository"
}

variable "repository_url" {
  type        = string
  description = "URL of the repository"
}
