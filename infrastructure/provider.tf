terraform {
  backend "azurerm" {
    use_azuread_auth = true
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.21.1"
    }
    namep = {
      source  = "jason-johnson/namep"
      version = "~> 2.2.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

provider "namep" {}

data "azuread_client_config" "current" {}

data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}
