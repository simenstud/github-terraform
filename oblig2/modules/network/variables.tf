variable "nsgname" {
    type        = string
    description = "The name of the network security group"
    default     = "nsg-tf-demo-001"
}

variable "vnetname" {
    type        = string
    description = "The name of the virtual network"
    default     = "vnet-tf-demo-001"
}

variable "rgname" {
    type        = string
    description = "The name of the resource group"
    default     = "rg-tf-demo-001"
}

variable "location" {
    type        = string
    description = "The location/region of the resource group"
    default     = "westeurope"
}

variable "subnetname" {
    type = string
    description = "The name of the subnet"
    default = "subnet-tf-demo-001"
}