variable region {
  description   = "Azure Region"
  type          = string
}

variable resource_group_name {
  description   = "Resource Group Name"
  type    = string
}

variable name {
  description   = "Azure Key Vault Name"
  type = string
}

variable randomize_name_suffix {
  description   = "Randomize Azure Key Vault Name Suffix"
  type = bool
  default = false
}

variable disk_encryption_access_enabled {
  description   = "Enable key access for disk encryption"
  type = bool
  default = false
}

variable vm_access_enabled {
  description   = "Enable key access for VMs"
  type = bool
  default = false
}

variable soft_delete_retention_days {
  description   = "Number of days before the actual "
  type = number
  default = 7 #TODO Is this the correct way to use the cloud provider's default value?
}

variable purge_protection_enabled {
  description   = "Number of days before the actual "
  type = bool
  default = false
}

variable sku_name {
  description   = "Number of days before the actual "
  type = string
  default = "standard"
}

variable enable_rbac {
  type = bool
  default = false
}

variable certificate_permissions {
  description   = "List of Certificate Permissions"
  type = list(string)
}

variable key_permissions {
  description   = "List of Key Permissions"
  type = list(string)
}

variable secret_permissions {
  description   = "List of Key Permissions"
  type = list(string)
}
