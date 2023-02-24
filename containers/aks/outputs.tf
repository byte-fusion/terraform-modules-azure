output "aks_kubelet_identity" {
  description = "The ID of Azure Key Vault"
  value       = azurerm_kubernetes_cluster.this.kubelet_identity[0]
}
