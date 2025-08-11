provider "azurerm" {
    features {}

    subscription_id = var.azure_subscription_id
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
    location = var.region
    name = var.rg_name
}

resource "azurerm_storage_account" "storage" {
    name = var.store_name
    resource_group_name = var.rg.name
    location = var.region
    account_tier = "Standard"
    account_replication_type = 
}