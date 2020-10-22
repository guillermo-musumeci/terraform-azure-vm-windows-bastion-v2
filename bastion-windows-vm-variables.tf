####################################
## Bastion Windows VM - Variables ##
####################################

# Windows bastion VM Admin User
variable "bastion-windows-admin-username" {
  type        = string
  description = "Windows bastion VM Admin User"
  default     = "tfadmin"
}

# Windows bastion VM Admin Password
variable "bastion-windows-admin-password" {
  type        = string
  description = "Windows bastion VM Admin Password"
  default     = "ITiKp9YWQ2sr"
}

# Windows Bastion VM Hostname (limited to 15 characters long)
variable "bastion-windows-vm-hostname" {
  type        = string
  description = "Windows Bastion VM Hostname"
  default     = "bastionwwin1"
}

# Windows bastion VM Virtual Machine Size
variable "bastion-windows-vm-size" {
  type        = string
  description = "Windows bastion VM Size"
  default     = "Standard_B2s"
}

##############
## OS Image ##
##############

# Windows Server 2019 SKU used to build VMs
variable "windows-2019-sku" {
  type        = string
  description = "Windows Server 2019 SKU used to build VMs"
  default     = "2019-Datacenter"
}

# Windows Server 2016 SKU used to build VMs
variable "windows-2016-sku" {
  type        = string
  description = "Windows Server 2016 SKU used to build VMs"
  default     = "2016-Datacenter"
}

# Windows Server 2012 R2 SKU used to build VMs
variable "windows-2012-sku" {
  type        = string
  description = "Windows Server 2012 R2 SKU used to build VMs"
  default     = "2012-R2-Datacenter"
}