locals {
  public_key = (var.ssh_key_autogenerate == true) ? tls_private_key.this[0] : file(var.ssh_key_path)
}

resource "tls_private_key" "this" {
  count     = var.ssh_key_autogenerate == true ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_ssh_public_key" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.region
  public_key          = local.public_key

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "this" {
  name                  = var.name
  resource_group_name   = var.resource_group_name
  location              = var.region
  size                  = var.size
  admin_username        = var.username
  network_interface_ids = var.network_interface_ids

  #   network_interface_ids = [
  #     azurerm_network_interface.example.id,
  #   ]

  admin_ssh_key {
    username   = var.username
    public_key = local.public_key
  }

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_type
    disk_size_gb         = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = var.image_reference_publisher
    offer     = var.image_reference_offer
    sku       = var.image_reference_sku
    version   = var.image_reference_version
  }

  tags = var.tags
}