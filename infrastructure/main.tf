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
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
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

resource "azurerm_dns_txt_record" "example" {
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
  domain_name       = "www.${azurerm_dns_txt_record.main.zone_name}"
  validation_type   = "dns-txt-token"
}
