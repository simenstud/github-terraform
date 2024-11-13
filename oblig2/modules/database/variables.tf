variable "saname" {
    type = string
    description = "The name of the storage account"
    default = "satfdemo002"
}

variable "rgname" {
    type = string
    description = "The name of the resource group"
    default = "rg-tf-demo-001"
}

variable "location" {
    type = string
    description = "The location/region of the resource group"
    default = "westeurope"
}

variable "mssqlname" {
    type = string
    description = "The name of the SQL database"
    default = "mssqldemo001"
}

variable "mssqldbname" {
    type = string
    description = "The name of the SQL database"
    default = "mssqldb001"
}