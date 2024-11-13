variable "aspname" {
    type = string
    description = "The name of the service plan"
    default = "asp-demo"
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

variable "saname" {
    type = string
    description = "The name of the storage account"
    default     = "sasd"
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

variable "pipname" {
    type = string
    description = "The name of the public ip"
    default = "pip-demo-001"
}

variable "lbname" {
    type = string
    description = "The name of the load balancer"
    default = "lb-demo-001"
}

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

variable "subnetname" {
    type = string
    description = "The name of the subnet"
    default = "subnet-tf-demo-001"
}

variable "scname" {
    type = string
    description = "Name of the storage container"
    default = "sc-demo-001"
}