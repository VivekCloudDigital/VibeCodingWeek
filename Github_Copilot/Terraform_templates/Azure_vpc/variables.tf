variable "resource_group_name" {
  description = "Name of the resource group"
  default = "rg"
  type        = string
}

variable "resource_group_location" {
  description = "Azure region where the resource group will be created"
  default = "South India"
  type        = string
}

variable "vn_name" {
  description = "Name of the virtual network"
  default     = "vn"
  type        = string
}

variable "vn_location" {
  description = "Azure region where the resource group will be created"
  default = "South India"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "pr_name" {
  description = "Name of the subnet"
  default = "pr-sn"
  type        = string
}

variable "pr_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "pb_name" {
  description = "Name of the subnet"
  default = "pb-sn"
  type        = string
}

variable "pb_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "sg_name" {
  description = "Name of the network security group"
  default     = "sg"
  type        = string
}

variable "sg_location" {
  description = "Azure region where the NSG will be created"
  type        = string
  default     = "South India"
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
  default = {
    "allow_ssh" = {
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    "allow_http" = {
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    "allow_https" = {
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
