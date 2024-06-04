variable "resource_group_name" {
  description = "The name of the resource group in which to create the IoT Hub"
  type        = string
}

variable "location" {
  description = "The location/region where the IoT Hub will be created"
  type        = string
  default     = "East US"
}

variable "iothub_name" {
  description = "The name of the IoT Hub"
  type        = string
}

variable "iothub_sku" {
  description = "The SKU of the IoT Hub"
  type        = string
  default     = "S1"
}

variable "iothub_capacity" {
  description = "The capacity of the IoT Hub"
  type        = number
  default     = 1
}

variable "retention_days" {
  description = "The number of days to retain the IoT Hub messages"
  type        = number
  default     = 7
}

variable "partition_count" {
  description = "The number of partitions for the IoT Hub"
  type        = number
  default     = 2
}

variable "enable_file_upload_notifications" {
  description = "Should file upload notifications be enabled?"
  type        = bool
  default     = false
}

variable "eventhub_connection_string" {
  description = "The connection string for the Event Hub endpoint"
  type        = string
}
