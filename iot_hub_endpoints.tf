resource "azurerm_iothub_endpoint_cosmosdb_account" "iot_cosmosdb_demo" {
  name                = "cosmos-db-endpoint"
  resource_group_name = azurerm_resource_group.iot_demo_rg.name
  iothub_id           = azurerm_iothub.iot_demo_hub.id
  container_name      = azurerm_cosmosdb_sql_container.cosmosdb_sql_container.name
  database_name       = azurerm_cosmosdb_sql_database.cosmosdb_sql_db.name
  endpoint_uri        = azurerm_cosmosdb_account.cosmosdb_demo.endpoint
  primary_key         = azurerm_cosmosdb_account.cosmosdb_demo.primary_key
  secondary_key       = azurerm_cosmosdb_account.cosmosdb_demo.secondary_key
}

resource "azurerm_iothub_endpoint_storage_container" "iot_storage_container_demo" {
  resource_group_name = azurerm_resource_group.iot_demo_rg.name
  iothub_id           = azurerm_iothub.iot_demo_hub.id
  name                = "storage-container-endpoint"

  container_name    = var.storage_container_name
  connection_string = azurerm_storage_account.iot_storage_account.primary_blob_connection_string

  file_name_format           = "{iothub}/{partition}_{YYYY}_{MM}_{DD}_{HH}_{mm}"
  batch_frequency_in_seconds = 60
  max_chunk_size_in_bytes    = 10485760
  encoding                   = "JSON"
}
