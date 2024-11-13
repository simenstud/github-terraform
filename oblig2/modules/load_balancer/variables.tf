variable "pipname" {
    type = string
    description = "The name of the public ip"
    default = "pip-demo-001"
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

variable "lbname" {
    type = string
    description = "The name of the load balancer"
    default = "lb-demo-001"
}