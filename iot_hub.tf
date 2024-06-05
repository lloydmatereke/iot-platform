resource "azurerm_iothub" "iot_demo_hub" {
  name                = var.iot_hub_name
  location            = azurerm_resource_group.iot_demo_rg.location
  resource_group_name = azurerm_resource_group.iot_demo_rg.name
  sku {
    name     = var.iot_hub_sku
    capacity = var.iot_hub_capacity
  }

}
