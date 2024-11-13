resource "azurerm_storage_account" "tfstate_storage" {
    name                      = "tfsate001"
    resource_group_name       = "rg-tf-state"
    location                  = var.location
    account_tier              = "Standard"
    account_replication_type  = "LRS"
}

resource "azurerm_storage_account" "common_storage" {
    name                      = var.csname
    resource_group_name       = var.rgname
    location                  = var.location
    account_tier              = "Standard"
    account_replication_type  = "LRS"
}