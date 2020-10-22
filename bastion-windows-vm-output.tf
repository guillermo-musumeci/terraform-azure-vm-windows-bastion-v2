#################################
## Bastion Windows VM - Output ##
#################################

# bastion Windows VM ID
output "bastion_windows_vm_id" {
  value = azurerm_windows_virtual_machine.bastion-windows-vm.id
}

# bastion Windows VM Name
output "bastion_windows_vm_name" {
  value = azurerm_windows_virtual_machine.bastion-windows-vm.name
}

# bastion Windows VM Admin Username
output "bastion_windows_vm_admin_username" {
  value = var.bastion-windows-admin-username
}

# bastion Windows VM Admin Password
output "bastion_windows_vm_admin_password" {
  value = var.bastion-windows-admin-password
}

# bastion Windows VM Public IP
output "bastion_windows_vm_public_ip" {
  value = azurerm_public_ip.bastion-windows-vm-ip.ip_address
}