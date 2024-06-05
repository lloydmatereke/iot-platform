resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.iot_demo_rg.name
  dns_prefix          = "iot-demo-aks"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "calico"
    load_balancer_sku = "standard"
  }

  tags = {
    Environment = "Development"
  }
}

resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = "${var.resource_group_name}-law"
  location            = var.location
  resource_group_name = azurerm_resource_group.iot_demo_rg.name
  sku                 = "PerGB2018"
}

resource "azurerm_kubernetes_cluster_node_pool" "example" {
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  name                  = "internal"
  node_count            = var.node_count
  vm_size               = "Standard_DS2_v2"
  os_disk_size_gb       = 30
}

resource "kubernetes_namespace" "iot_demo" {
  metadata {
    name = "iot-demo"
  }
}

resource "kubernetes_secret" "iot_demo_cosmosdb" {
  metadata {
    name      = "cosmosdb"
    namespace = kubernetes_namespace.iot_demo.metadata[0].name
  }
  data = {
    cosmosdb_connection_string = "AccountEndpoint=${azurerm_cosmosdb_account.cosmosdb_demo.endpoint};AccountKey=${azurerm_cosmosdb_account.cosmosdb_demo.primary_key};"
  }
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.aks.kube_config[0].host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
}

#resource "kubernetes_secret" "eventhub" {
#  metadata {
#    name      = "eventhub"
#    namespace = kubernetes_namespace.example.metadata[0].name
#  }
#  data = {
#    eventhub_connection_string = var.eventhub_connection_string
#  }
#}
