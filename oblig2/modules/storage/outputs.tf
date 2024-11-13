output "storage_account_tier" {
    value = data.azurerm_storage_account.sa.account_tier
}