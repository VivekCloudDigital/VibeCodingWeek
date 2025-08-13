resource "azurerm_linux_web_app" "main" {
  name                = var.web_app_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  service_plan_id     = azurerm_app_service_plan.main.id

  site_config {
    application_stack {
      node_version = "18-lts" # You can set any supported version
    }
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "NODE_ENV" = "production"
  }
}
