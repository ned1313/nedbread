output "website_url" {
  value       = azurerm_static_web_app.web.default_host_name
  description = "The URL of the static website"
}

output "api_key" {
  value       = nonsensitive(azurerm_static_web_app.web.api_key)
  description = "The API key for the static website"
}

output "nameservers" {
  value       = azurerm_dns_zone.main.name_servers
  description = "The nameservers for the DNS zone"
}
