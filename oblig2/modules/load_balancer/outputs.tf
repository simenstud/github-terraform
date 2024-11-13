output "public_ip" {
    description = "The public IP address for the load balancer"
    value       = azurerm_public_ip.pip.ip_address
}