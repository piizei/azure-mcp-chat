resource "azurerm_resource_group" "main" {
  name     = provider::namep::namestring("azurerm_resource_group", local.namep_config)
  location = var.location
}
