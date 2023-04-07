# Configure Terraform to set the required AzureRM provider
# version and features{} block.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.19.0"
      configuration_aliases = [
        azurerm.connectivity,
        azurerm.management,
      ]
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "connectivity"
  subscription_id = var.connectivitySubscriptionId
  features {}
}
provider "azurerm" {
  alias           = "management"
  subscription_id = var.managementSubscriptionId
  features {}
}
provider "azurerm" {
  alias           = "identity"
  subscription_id = var.identitySubscriptionId
  features {}
}
provider "azurerm" {
  alias           = "sandbox"
  subscription_id = var.sandboxSubscriptionId
  features {}
}

