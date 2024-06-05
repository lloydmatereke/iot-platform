output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.iot_demo_rg.name
}

output "iot_hub_name" {
  description = "The name of the IoT hub"
  value       = azurerm_iothub.iot_demo_hub.name
}

output "cosmosdb_account_name" {
  description = "The name of the Cosmos DB account"
  value       = azurerm_cosmosdb_account.cosmosdb_demo.name
}

output "storage_account_name" {
  description = "The name of the Storage account"
  value       = azurerm_storage_account.iot_storage_account.name
}

output "cosmosdb_sql_db_name" {
  description = "The name of the Cosmos DB SQL database"
  value       = azurerm_cosmosdb_sql_database.cosmosdb_sql_db.name
}

output "cosmosdb_connection_string" {
  description = "The connection string for the Cosmos DB account"
  value       = "AccountEndpoint=${azurerm_cosmosdb_account.cosmosdb_demo.endpoint};AccountKey=${azurerm_cosmosdb_account.cosmosdb_demo.primary_key};"
  sensitive   = true
}

output "storage_container_name" {
  description = "The name of the Storage container"
  value       = azurerm_storage_container.iot_storage_container.name
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_endpoint" {
  description = "The endpoint of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].host
  sensitive   = true
}

output "aks_client_certificate" {
  description = "The AKS cluster client certificate"
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive   = true
}

output "kube_config" {
  description = "The AKS cluster config"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}
