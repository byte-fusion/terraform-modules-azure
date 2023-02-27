variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "dns_vnet_link_name" {
  description = "DNS VNET Link Name"
  type        = string
}

variable "dns_zone_name" {
  description = "DNS Zone Name"
  type        = string
}

variable "dns_vnet_id" {
  description = "VNET ID"
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}