resource "azurerm_resource_group" "iot_demo_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_iothub" "iot_demo_hub" {
  name                = var.iothub_name
  location            = azurerm_resource_group.iot_demo_rg.location
  resource_group_name = azurerm_resource_group.iot_demo_rg.name
  sku {
    name     = var.iothub_sku
    capacity = var.iothub_capacity
  }

#  retention_days            = var.retention_days
#  partition_count           = var.partition_count
#  enable_file_upload_notifications = var.enable_file_upload_notifications

  fallback_route {
    enabled                   = true
    source                    = "DeviceMessages"
    condition                 = "true"
    endpoint_names            = ["events"]
#    route_id                  = "fallback"
  }

  endpoint {
    type           = "EventHub"
    connection_string = var.eventhub_connection_string
    name            = "events"
  }
}
