###############################
## Bastion Windows VM - Main ##
###############################

# Create Network Security Group to Access Bastion VM from Internet
resource "azurerm_network_security_group" "bastion-windows-nsg" {
  name                = "${var.prefix}-${var.environment}-bastion-windows-nsg"
  location            = azurerm_resource_group.bastion-rg.location
  resource_group_name = azurerm_resource_group.bastion-rg.name

  security_rule {
    name                       = "AllowRDP"
    description                = "Allow RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*" 
  }

  tags = {
    application = var.app_name
    environment = var.environment 
  }
}

# Associate the Bastion NSG with the Subnet
resource "azurerm_subnet_network_security_group_association" "bastion-windows-nsg-association" {
  subnet_id                 = azurerm_subnet.bastion-subnet.id
  network_security_group_id = azurerm_network_security_group.bastion-windows-nsg.id
}

# Get a Static Public IP
resource "azurerm_public_ip" "bastion-windows-vm-ip" {
  name                = "${var.prefix}-${var.environment}-bastion-windows-ip"
  location            = azurerm_resource_group.bastion-rg.location
  resource_group_name = azurerm_resource_group.bastion-rg.name
  allocation_method   = "Static"
  
  tags = { 
    environment = var.environment 
  }
}

# Create Network Card for VM
resource "azurerm_network_interface" "bastion-windows-vm-nic" {
  depends_on=[azurerm_public_ip.bastion-windows-vm-ip]

  name                      = "${var.prefix}-${var.environment}-bastion-windows-nic"
  location                  = azurerm_resource_group.bastion-rg.location
  resource_group_name       = azurerm_resource_group.bastion-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.bastion-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastion-windows-vm-ip.id
  }

  tags = { 
    environment = var.environment 
  }
}

# Create Windows Server
resource "azurerm_windows_virtual_machine" "bastion-windows-vm" {
  depends_on=[azurerm_network_interface.bastion-windows-vm-nic]

  name                  = "${var.prefix}-${var.environment}-bastion-windows-vm"
  location              = azurerm_resource_group.bastion-rg.location
  resource_group_name   = azurerm_resource_group.bastion-rg.name
  size                  = var.bastion-windows-vm-size
  network_interface_ids = [azurerm_network_interface.bastion-windows-vm-nic.id]
  
  computer_name         = var.bastion-windows-vm-hostname
  admin_username        = var.bastion-windows-admin-username
  admin_password        = var.bastion-windows-admin-password

  os_disk {
    name                 = "${var.prefix}-${var.environment}-bastion-windows-os-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.windows-2019-sku
    version   = "latest"
  }

  enable_automatic_updates = true
  provision_vm_agent       = true

  tags = {
    environment = var.environment 
  }
}