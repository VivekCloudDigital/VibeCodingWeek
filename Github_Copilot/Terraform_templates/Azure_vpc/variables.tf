variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "Azure region where the resource group will be created"
  type        = string
}

variable "vn_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vn_location" {
  description = "Azure region where the resource group will be created"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "pr_name" {
  description = "Name of the subnet"
  type        = string
}

variable "pr_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
}

variable "pb_name" {
  description = "Name of the subnet"
  type        = string
}

variable "pb_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
}

variable "sg_name" {
  description = "Name of the network security group"
  type        = string
}

variable "sg_location" {
  description = "Azure region where the NSG will be created"
  type        = string
}

variable "security_rules" {
  description = "Map of security rules"
  type = map(object({
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}
