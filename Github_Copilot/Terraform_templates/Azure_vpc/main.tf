terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>5.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#resource group main.tf

# Azure Resource Group Module
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Azure Virtual Network Module
resource "azurerm_virtual_network" "vn" {
  name                = var.vn_name
  address_space       = var.address_space
  location            = var.vn_location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "dev"
    owner       = "devops"
  }
}
# Azure Subnet Module
resource "azurerm_subnet" "private" {
  name                 = var.pr_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = var.pr_address_prefixes
  private_endpoint_network_policies = "Enabled"
}

resource "azurerm_subnet" "public" {
  name                 = var.pb_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = var.pb_address_prefixes
}

resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.sg.id
}

resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.sg.id
}

# Azure Network Security Group Module
resource "azurerm_network_security_group" "sg" {
  name                = var.sg_name
  location            = var.sg_location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "dev"
    owner       = "devops"
  }
}

# Default security rules
resource "azurerm_network_security_rule" "default_rules" {
  for_each = var.security_rules

  name                        = each.key
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.sg.name
}

# Azure web app module
resource "azure_app_service_plan" "app" {
  name                 = var.app_service_plan_name
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  kind                 = "Linux"

  sku {
    tier = "Basic"
    size = var.web_app_sku
  }

  reserved = true
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.web_app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plam_id     = azurerm_app_service_plan.app.id

  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }
}
