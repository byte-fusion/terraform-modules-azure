variable "region" {
  description = "Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "name" {
  description = "Network Interface Name"
  type        = number
}

variable "public_ip_enabled" {
  description = "Create a public IP for the NIC."
  type        = bool
  default     = false
}

variable "public_ip_allocation_method" {
  description = "Create a public IP for the NIC."
  type        = string
  default     = "Dynamic"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}