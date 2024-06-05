resource "azurerm_storage_account" "iot_storage_account" {
  name                            = var.storage_account_name
  resource_group_name             = azurerm_resource_group.iot_demo_rg.name
  location                        = azurerm_resource_group.iot_demo_rg.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    environment = "development"
  }
}

resource "azurerm_storage_container" "iot_storage_container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.iot_storage_account.name
  container_access_type = "private"
}
