output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.main.public_ip_address
}

output "admin_password" {
  sensitive = true
  value     = azurerm_linux_virtual_machine.main.admin_password
}
output "lb_public_ip_address" {
  value = azurerm_public_ip.lb_public_ip.ip_address
}
