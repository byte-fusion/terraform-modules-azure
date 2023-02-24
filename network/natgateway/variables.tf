variable "region" {
  description = "Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "name" {
  description = "NAT Gatway Name"
  type        = string
}

variable "subnet_ids" {
  description = "List of Subnet IDs to be associated"
  type        = map(string)
}

variable "zones" {
  description = "NAT Gateway Availability Zones"
  type        = list(string)
}