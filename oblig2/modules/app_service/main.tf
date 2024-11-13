resource "random_string" "random_string" {
    length = 10
    special = false
    upper = false
}

resource "azurerm_service_plan" "asp" {
    name                = "${lower(var.aspname)}-${random_string.random_string.result}"
    resource_group_name = var.rgname
    location            = var.location
    os_type             = "Linux"
    sku_name            = "P1v2"
}