terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "4.3.0"
        }
    } #test

    backend "azurerm" {
        resource_group_name  = "rg-backend-sd"
        storage_account_name = "sabetfszipk1f4ych"
        container_name       = "tfstate"
        key                  = "prosjekt.terraform.tfstate"
    }
}

provider "azurerm" {
    features {}
    subscription_id = "a3adf20e-4966-4afb-b717-4de1baae6db1"
}

locals {
    workspace = terraform.workspace
    rgname    = "sd-${terraform.workspace}-rg"
}

resource "azurerm_resource_group" "rg" {
    name     = local.rgname
    location = var.location
}

module "app_service" {
    source      = "../modules/app_service"
    rgname      = azurerm_resource_group.rg.name
    location    = var.location
}

module "database" {
    source      = "../modules/database"
    rgname      = azurerm_resource_group.rg.name
    location    = var.location
}

module "load_balancer" {
    source      = "../modules/load_balancer"
    rgname      = azurerm_resource_group.rg.name
    location    = var.location
}


module "network" {
    source      = "../modules/network"
    rgname      = azurerm_resource_group.rg.name
    location    = var.location
    vnetname    = var.vnetname
    nsgname     = var.nsgname
    subnetname  = var.subnetname
}

module "storage" {
    source      = "../modules/storage"
    rgname      = azurerm_resource_group.rg.name
    location    = var.location
    scname      = var.scname
}