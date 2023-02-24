locals {
  default_node_pool = slice(var.node_pools, 0, 1)[0]
  custom_node_pools = slice(var.node_pools, 1, length(var.node_pools))
  # subnets = data.azurerm_virtual_network.infra.subnets
}

resource "azurerm_kubernetes_cluster" "this" {
  name                    = var.cluster_name
  location                = var.region
  resource_group_name     = var.resource_group_name
  dns_prefix              = var.dns_prefix != null ? var.dns_prefix : var.cluster_name
  kubernetes_version      = var.kubernetes_version
  private_cluster_enabled = var.private_cluster_enabled
  sku_tier                = var.apiserver_sku_tier
  disk_encryption_set_id  = var.disk_encryption_set_id
  private_dns_zone_id     = var.private_cluster_enabled == true ? var.private_dns_zone_id : null

  default_node_pool {
    name                   = local.default_node_pool.name
    orchestrator_version   = local.default_node_pool.orchestrator_version
    vm_size                = local.default_node_pool.vm_size
    enable_host_encryption = local.default_node_pool.enable_host_encryption
    enable_node_public_ip  = local.default_node_pool.enable_public_ip
    os_disk_size_gb        = local.default_node_pool.os_disk_size_gb
    os_disk_type           = local.default_node_pool.os_disk_type
    vnet_subnet_id         = var.node_subnets != null ? var.node_subnets[local.default_node_pool.name] : null
    node_count             = local.default_node_pool.node_count
    enable_auto_scaling    = local.default_node_pool.enable_auto_scaling
    min_count              = local.default_node_pool.enable_auto_scaling == true ? local.default_node_pool.min_count : null
    max_count              = local.default_node_pool.enable_auto_scaling == true ? local.default_node_pool.max_count : null
    max_pods               = local.default_node_pool.max_pods
    ultra_ssd_enabled      = local.default_node_pool.ultra_ssd_enabled
    node_labels            = local.default_node_pool.labels
    zones                  = local.default_node_pool.availability_zones
  }

  dynamic "kubelet_identity" {
    for_each = var.kubelet_identity != null ? ["kubelet_identity_used"] : []

    content {
      user_assigned_identity_id = var.kubelet_identity.id
      client_id                 = var.kubelet_identity.client_id
      object_id                 = var.kubelet_identity.object_id
    }
  }

  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_policy == "none" ? null : var.network_policy

    dns_service_ip     = var.network_dns_service_ip
    docker_bridge_cidr = var.network_docker_bridge_cidr
    service_cidr       = var.network_service_cidr
    pod_cidr           = var.network_pod_cidr

    outbound_type     = var.network_outbound_type
    load_balancer_sku = var.network_outbound_type == "loadBalancer" ? "standard" : null
  }

  identity {
    type         = length(var.identity_ids) > 0 ? "UserAssigned" : "SystemAssigned"
    identity_ids = length(var.identity_ids) > 0 ? var.identity_ids : null
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "this" {
  for_each = {
    for nodepool in local.custom_node_pools :
    nodepool.name => nodepool
  }

  name                   = each.value.name
  orchestrator_version   = each.value.orchestrator_version
  kubernetes_cluster_id  = azurerm_kubernetes_cluster.this.id
  vnet_subnet_id         = var.node_subnets != null ? var.node_subnets[each.value.name] : null
  vm_size                = each.value.vm_size
  enable_host_encryption = each.value.enable_host_encryption
  os_disk_size_gb        = each.value.os_disk_size_gb
  os_disk_type           = each.value.os_disk_type
  enable_auto_scaling    = each.value.enable_auto_scaling
  node_count             = each.value.node_count
  min_count              = each.value.min_count
  max_count              = each.value.max_count
  max_pods               = each.value.max_pods
  enable_node_public_ip  = each.value.enable_public_ip
  ultra_ssd_enabled      = each.value.ultra_ssd_enabled
  node_labels            = each.value.labels
  node_taints            = each.value.taints
  zones                  = each.value.availability_zones

  # lifecycle {
  #   ignore_changes = [
  #     node_count,
  #     os_disk_size_gb,
  #     os_disk_type
  #   ]
  # }
}