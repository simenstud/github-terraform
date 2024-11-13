resource "azurerm_network_security_group" "nsg" {
    name                = var.nsgname
    location            = var.location
    resource_group_name = var.rgname
}

resource "azurerm_virtual_network" "vnet" {
    name                = var.vnetname
    location            = var.location
    resource_group_name = var.rgname
    address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
    name                 = var.subnetname
    resource_group_name  = var.rgname
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "sansgassociation" {
    subnet_id                 = azurerm_subnet.subnet.id
    network_security_group_id = azurerm_network_security_group.nsg.id
}