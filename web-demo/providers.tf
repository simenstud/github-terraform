terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "4.3.0"
        }
    }

    backend "azurerm" {
        resource_group_name  = "rg-backend-tfstate"
        storage_account_name = "sabetfstrsfv2luge"
        container_name       = "tfstate"
        key                  = "web-demo.terraform.tfstate"
    }
}

provider "azurerm" {
    features {}
    subscription_id = "a3adf20e-4966-4afb-b717-4de1baae6db1"
}