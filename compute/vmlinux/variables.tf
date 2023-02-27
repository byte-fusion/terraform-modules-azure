variable "region" {
  description = "Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "name" {
  description = "VM Name"
  type        = string
}

variable "size" {
  description = "VM Size"
  type        = string
}

variable "image_reference_publisher" {
  description = "Image Reference Publisher"
  type        = string
  default     = "Canonical"
}

variable "image_reference_offer" {
  description = "Image Reference Offer"
  type        = string
  default     = "UbuntuServer"
}

variable "image_reference_sku" {
  description = "Image Reference SKU"
  type        = string
  default     = "20.04-LTS"
}

variable "image_reference_version" {
  description = "Image Reference Version"
  type        = string
  default     = "latest"
}

variable "username" {
  description = "Admin Username"
  type        = string
  default     = "azureuser"
}

variable "ssh_key_autogenerate" {
  description = "Generate the SSH Key Automatically. Don't enable this in prod environments due to the ssh key being stored unencrypted."
  type        = bool
  default     = false
}

variable "ssh_key_path" {
  description = "SSH Key Path"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "os_disk_caching" {
  description = "OS Disk Caching"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_type" {
  description = "OS Disk Storage Type"
  type        = string
  default     = "Standard_LRS"
}

variable "os_disk_size_gb" {
  description = "OS Disk Storage Type"
  type        = number
  default     = null
}

variable "network_interface_ids" {
  description = "Network Interface IDs"
  type        = list(string)
  default     = []
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}