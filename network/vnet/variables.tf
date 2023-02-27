variable "region" {
  description = "Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "name" {
  description = "Virtual Network Name"
  type        = string
}

variable "address_spaces" {
  description = "List of Virtual Network Address Spaces"
  type        = list(string)
}

variable "subnets" {
  description = "List of objects that will create subnets" #TODO Should this be a list or a map?
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
  default = []

}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}