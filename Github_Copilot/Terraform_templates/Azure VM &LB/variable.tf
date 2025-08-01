variable "resource_group_location" {
  description = "Location of the resource group."
  default     = "eastus"
}

variable "prefix" {
  type        = string
  default     = "linux-vm"
  description = "Prefix for all resources"
}
