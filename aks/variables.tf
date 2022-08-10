variable region {
  description = "Azure Region"
  type        = string
}

variable resource_group_name {
  description   = "Resource Group Name"
  type          = string
}

variable cluster_name {
  description = "AKS Cluster Name"
  type        = string
}

variable kubernetes_version {
  description = "AKS K8s Version"
  type    = string
}

variable private_cluster_enabled {
  description = "Enable Private AKS Cluster"
  type    = bool
  default = false
}

variable apiserver_sku_tier {
  description = "AKS API Server SKU Tier"
  type        = string
  default     = null
}

variable disk_encryption_set_id {
  description = "AKS Disk Encryption Set Resource ID"
  type        = string
  default     = null
}

variable private_dns_zone_id {
  description = "AKS Private DNS Zone ID"
  type        = string
  default     = null
}

variable dns_prefix {
  description = "AKS Private DNS Zone ID"
  type        = string
  default     = null
}

variable network_plugin {
  description = "AKS Network Plugin"
  type        = string
  default     = "kubenet"
}

variable network_policy {
  description = "AKS Network Policy"
  type    = string
  default = "calico"
}

variable network_dns_service_ip {
  description = "AKS DNS Service IP"
  type    = string
  default = null
}

variable network_docker_bridge_cidr {
  description = "AKS Docker Bridge CIDR"
  type    = string
  default = null
}

variable network_service_cidr {
  description = "AKS Service CIDR"
  type    = string
  default = null
}

variable network_pod_cidr {
  description = "AKS Pod CIDR"
  type    = string
  default = null
}

variable network_load_balancer_sku {
  description = "AKS Load Balancer SKU"
  type    = string
  default = null
}

variable identity_ids {
  description = "AKS User IDs"
  type    = list(string)
  default = []
}

variable kubelet_identity {
  description = "AKS Kubelet User Assigned ID"
  type = object({
    id                  = string
    object_id           = string
    client_id           = string
  })
  default = null
}

# variable default_node_pool {
#   type = object({
#     name                  = string
#     orchestrator_version  = string
#     mode                  = string
#     vm_size               = string
#     os_disk_size_gb       = number
#     os_disk_type          = string
#     vnet_name             = string
#     subnet_name           = string
#     node_count            = number
#     enable_auto_scaling   = bool
#     min_count             = number
#     max_count             = number
#     max_pods              = number
#     availability_zones    = list(string)
#     enable_public_ip      = bool
#     ultra_ssd_enabled     = bool
#     labels                = map(string)
#   })
# }

variable node_subnets {
  type = map(string)
  default = null
}

variable node_pools {
  type = list(object({
    name                  = string
    orchestrator_version  = string
    vm_size               = string
    os_disk_size_gb       = number
    os_disk_type          = string
    vnet_name             = string
    subnet_name           = string
    node_count            = number
    enable_auto_scaling   = bool
    min_count             = number
    max_count             = number
    max_pods              = number
    availability_zones    = list(string)
    enable_public_ip      = bool
    ultra_ssd_enabled     = bool
    labels                = map(string)
    taints                = list(string)
    mode                  = string
  }))
}