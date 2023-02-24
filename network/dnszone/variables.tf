variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "zone_name" {
  description = "DNS Zone Name"
  type        = string
}

variable "private_dns_enable" {
  description = "Enable Private DNS"
  type        = bool
  default     = false
}