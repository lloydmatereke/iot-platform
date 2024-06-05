resource "azurerm_cosmosdb_account" "cosmosdb_demo" {
  name                = var.cosmosdb_account_name
  location            = var.location
  resource_group_name = azurerm_resource_group.iot_demo_rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  capabilities {
    name = "EnableServerless"
  }

  capabilities {
    name = "EnableAggregationPipeline"
  }

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  capabilities {
    name = "EnableServerless"
  }

  is_virtual_network_filter_enabled = false
}


resource "azurerm_cosmosdb_sql_database" "cosmosdb_sql_db" {
  name                = var.cosmosdb_sql_db_name
  resource_group_name = azurerm_resource_group.iot_demo_rg.name
  account_name        = azurerm_cosmosdb_account.cosmosdb_demo.name
}

resource "azurerm_cosmosdb_sql_container" "cosmosdb_sql_container" {
  name                = var.cosmosdb_sql_container_name
  resource_group_name = azurerm_resource_group.iot_demo_rg.name
  account_name        = azurerm_cosmosdb_account.cosmosdb_demo.name
  database_name       = azurerm_cosmosdb_sql_database.cosmosdb_sql_db.name
  partition_key_path  = var.cosmosdb_partition_key_path
}
