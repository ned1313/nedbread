output "website_url" {
  value       = azurerm_static_web_app.web.default_host_name
  description = "The URL of the static website"
}

output "api_key" {
  value       = azurerm_static_web_app.web.api_key
  description = "The API key for the static website"
  sensitive   = true
}
