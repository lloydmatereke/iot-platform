resource "azurerm_resource_group" "iot_demo_rg" {
  name     = var.resource_group_name
  location = var.location
}
