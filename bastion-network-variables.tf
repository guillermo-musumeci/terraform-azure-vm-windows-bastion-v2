#################################
## Bastion Network - Variables ##
#################################

variable "bastion-vnet-cidr" {
  type        = string
  description = "The CIDR of the Bastion VNET"
}

variable "bastion-subnet-cidr" {
  type        = string
  description = "The CIDR for the Bastion subnet"
}
