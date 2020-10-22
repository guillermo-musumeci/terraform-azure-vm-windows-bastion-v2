####################
# Common Variables #
####################
company     = "kopicloud"
prefix      = "kopi"
environment = "dev"
location    = "northeurope"
description = "Deploy a Bastion Server"
owner       = "Guillermo Musumeci"
app_name    = "IaaS"

##################
# Authentication #
##################
azure-subscription-id = "complete-this"
azure-client-id       = "complete-this"
azure-client-secret   = "complete-this"
azure-tenant-id       = "complete-this"

###################
# Bastion Network #
###################
bastion-vnet-cidr   = "10.10.0.0/16"
bastion-subnet-cidr = "10.10.1.0/24"

##############
# Bastion VM #
##############
bastion-windows-vm-hostname    = "tfwinbastion" // Limited to 15 characters
bastion-windows-vm-size        = "Standard_B1s"
bastion-windows-admin-username = "tfadmin"
bastion-windows-admin-password = "MyP@ssw0rd88"
