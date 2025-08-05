output "id" {
  description = "The ID of the Resource Group"
  value       = azurerm_resource_group.rg.id
}

output "resource_group_name" {
  description = "The name of the Resource Group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  description = "The location of the Resource Group"
  value       = azurerm_resource_group.rg.location
}

output "vn_name" {
  description = "The name of the Virtual Network"
  value       = azurerm_virtual_network.vn.name
}

output "address_space" {
  description = "The address space of the Virtual Network"
  value       = azurerm_virtual_network.vn.address_space
}

output "pb_sn_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.public.id
}

output "pb_sn_name" {
  description = "The name of the Subnet"
  value       = azurerm_subnet.public.name
}

output "pr_sn_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.private.id
}

output "pr_sn_name" {
  description = "The name of the Subnet"
  value       = azurerm_subnet.private.name
}

output "sg_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.sg.id
}

output "sg_name" {
  description = "The name of the Network Security Group"
  value       = azurerm_network_security_group.sg.name
}
