resource "azurerm_iothub_route" "cosmosdb_route" {
  resource_group_name = azurerm_resource_group.iot_demo_rg.name
  iothub_name         = azurerm_iothub.iot_demo_hub.name
  name                = "cosmosdb-account-route"

  source         = "DeviceMessages"
  condition      = "true"
  endpoint_names = [azurerm_iothub_endpoint_cosmosdb_account.iot_cosmosdb_demo.name]
  enabled        = true
}

resource "azurerm_iothub_route" "storage_container_route" {
  resource_group_name = azurerm_resource_group.iot_demo_rg.name
  iothub_name         = azurerm_iothub.iot_demo_hub.name
  name                = "storage-container-route"

  source         = "DeviceMessages"
  condition      = "true"
  endpoint_names = [azurerm_iothub_endpoint_storage_container.iot_storage_container_demo.name]
  enabled        = true
}
