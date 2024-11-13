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