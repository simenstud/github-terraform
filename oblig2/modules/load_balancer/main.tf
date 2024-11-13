resource "azurerm_public_ip" "pip" {
    name                = var.pipname
    location            = var.location
    resource_group_name = var.rgname
    allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
    name                = var.lbname
    location            = var.location
    resource_group_name = var.rgname

    frontend_ip_configuration {
        name                 = "PublicIPAddress"
        public_ip_address_id = azurerm_public_ip.pip.id
    }
}