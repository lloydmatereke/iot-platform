variable "resource_group_name" {
  description = "The name of the resource group in which to create the IoT Hub"
  type        = string
}

variable "location" {
  description = "The location/region where the IoT Hub will be created"
  type        = string
  default     = "East US"
}

variable "secondary_location" {
  description = "The secondary location/region for Cosmos DB account"
  type        = string
  default     = "West US"
}

variable "iot_hub_name" {
  description = "The name of the IoT Hub"
  type        = string
}

variable "iot_hub_sku" {
  description = "The SKU of the IoT Hub"
  type        = string
  default     = "S1"
}

variable "iot_hub_capacity" {
  description = "The capacity of the IoT Hub"
  type        = number
  default     = 1
}

variable "cosmosdb_account_name" {
  description = "The name of the Cosmos DB account"
  type        = string
}

variable "cosmosdb_sql_db_name" {
  description = "The name of the Cosmos DB SQL database"
  type        = string
}

variable "cosmosdb_sql_container_name" {
  description = "The name of the Cosmos DB SQL container"
  type        = string
}

variable "cosmosdb_partition_key_path" {
  description = "The partition key path for the Cosmos DB SQL container"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Storage account"
  type        = string
}

variable "storage_container_name" {
  description = "The name of the Storage container"
  type        = string
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
  default     = 3
}
