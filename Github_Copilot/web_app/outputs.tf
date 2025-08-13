output "web_app_default_hostname" {
  description = "The default DNS name of the web app"
  value       = azurerm_linux_web_app.main.default_hostname
}
