terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
    features {}
}

# Define variables
resource "random_string" "resource_code" {
    length  = 5
    special = false
    upper   = false
}

# Create a resource group
resource "azurerm_resource_group" "tfstate" {
    location = "East US"
    name = "tfstate"
}

# Create a storage account
resource "azurerm_storage_account" "tfstate" {
    name = "tfstate${random_string.resource_code.result}"
    resource_group_name = azurerm_resource_group.tfstate.name
    location = azurerm_resource_group.tfstate.location
    account_tier = "Standard"
    account_replication_type = "LRS"
}

# Create a storage container
resource "azurerm_storage_container" "tfstate" {
    name = "tfstate"
    storage_account_name = azurerm_storage_account.tfstate.name
    container_access_type = "private"
}

# Output the storage account name
output "storage_account_name" {
    value = azurerm_storage_account.tfstate.name
}