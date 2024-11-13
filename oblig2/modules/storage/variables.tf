variable "saname" {
    type        = string
    description = "The name of the storage account"
    default     = "sasd"
}

variable "rgname" {
    type        = string
    description = "The name of the resource group"
    default     = "rg-tf-demo-001"
}

variable "location" {
    type = string
    description = "The location/region of the resource group"
    default = "westeurope"
}

variable "scname" {
    type = string
    description = "Name of the storage container"
    default = "sc-demo-001"
}