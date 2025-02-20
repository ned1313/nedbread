terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

import {
  id = "/subscriptions/4d8e572a-3214-40e9-a26f-8f71ecd24e0d/resourceGroups/rg-nedbread/providers/Microsoft.Web/staticSites/nedbread"
  to = azurerm_static_web_app.web
}

resource "azurerm_static_web_app" "web" {
  name                = var.static_site_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_tier            = "Free"
  sku_size            = "Free"

  tags = {
    Environment = var.environment
    Project     = "Ned Bread"
  }
}

resource "azurerm_dns_zone" "main" {
  name                = var.dns_zone_name
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    Environment = var.environment
    Project     = "Ned Bread"
  }
}

resource "azurerm_dns_txt_record" "main" {
  name                = "_dnsauth.www"
  zone_name           = var.dns_zone_name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300
  record {
    value = azurerm_static_web_app_custom_domain.main.validation_token
  }
}

resource "azurerm_static_web_app_custom_domain" "main" {
  static_web_app_id = azurerm_static_web_app.web.id
  domain_name       = "www.${var.dns_zone_name}"
  validation_type   = "dns-txt-token"
}
