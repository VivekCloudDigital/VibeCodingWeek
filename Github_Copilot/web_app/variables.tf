variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "test-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "app_service_plan_name" {
  description = "Name of the App Service plan"
  type        = string
  default     = "test-service-plan"
}

variable "web_app_name" {
  description = "Name of the Web App"
  type        = string
  default     = "test-node-webapp"
}
