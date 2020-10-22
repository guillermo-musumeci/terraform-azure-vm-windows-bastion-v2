##############################
## Bastion Network - Output ##
##############################

output "bastion_rg" {
  value = azurerm_resource_group.bastion-rg
}

output "bastion_vnet" {
  value = azurerm_virtual_network.bastion-vnet
}

output "bstion_subnet" {
  value = azurerm_subnet.bastion-subnet
}

