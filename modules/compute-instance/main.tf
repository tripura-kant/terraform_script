locals {

  scopes = ["https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring.write",
        "https://www.googleapis.com/auth/servicecontrol",
        "https://www.googleapis.com/auth/service.management.readonly",
        "https://www.googleapis.com/auth/trace.append"]

}
resource "google_compute_instance" "instance" {
  project                   = var.project_id
  name                      = var.instance_name
  machine_type              = var.machine_type
  allow_stopping_for_update = var.allow_stopping_for_update
  zone                      = var.zone_name
  tags                      = var.tags

  description               = var.description
  labels                    = var.labels
  metadata                  = var.metadata_list
  can_ip_forward            = var.can_ip_forward
  deletion_protection       = var.deletion_protection

  dynamic "attached_disk" {
    for_each = length(var.attached_disk) != 0 ? [for i in var.attached_disk : {
      source                  = lookup(i, "source", null)
      device_name             = lookup(i, "device_name", null)
      mode                    = lookup(i, "mode", null)
      disk_encryption_key_raw = lookup(i, "disk_encryption_key_raw", null)
      kms_key_self_link       = lookup(i, "kms_key_self_link", null)
    }] : []
    content {
      source                  = attached_disk.value.source
      device_name             = attached_disk.value.device_name
      mode                    = attached_disk.value.mode
      disk_encryption_key_raw = attached_disk.value.disk_encryption_key_raw
      kms_key_self_link       = attached_disk.value.kms_key_self_link
    }
  }

  dynamic "boot_disk" {
    for_each = length(var.boot_disk) != 0 ? [{
      auto_delete             = lookup(var.boot_disk, "auto_delete", true)
      device_name             = lookup(var.boot_disk, "device_name", null)
      mode                    = lookup(var.boot_disk, "mode", "READ_WRITE")
      disk_encryption_key_raw = lookup(var.boot_disk, "disk_encryption_key_raw", null)
      kms_key_self_link       = lookup(var.boot_disk, "kms_key_self_link", null)
      size                    = lookup(var.boot_disk, "size", null)
      type                    = lookup(var.boot_disk, "type", null)
      image                   = lookup(var.boot_disk, "image", null)
      source                  = lookup(var.boot_disk, "source", null)
    }] : []
    content {
      auto_delete             = boot_disk.value.auto_delete
      device_name             = boot_disk.value.device_name
      mode                    = boot_disk.value.mode
      disk_encryption_key_raw = boot_disk.value.disk_encryption_key_raw
      kms_key_self_link       = boot_disk.value.kms_key_self_link
      initialize_params {
        size  = boot_disk.value.size
        type  = boot_disk.value.type
        image = boot_disk.value.image
      }
      source = boot_disk.value.source
    }
  }

  dynamic "network_interface" {
    for_each = length(var.network_interface) != 0 ? [for i in var.network_interface : {
      network_name       = lookup(i, "network_name", null)
      subnetwork_name    = lookup(i, "subnetwork_name", null)
      network_ip         = lookup(i, "network_ip", null)
      external_ip_needed = lookup(i, "external_ip_needed", false)
      access_config      = lookup(i, "access_config", [{}])
      alias_ip_range     = lookup(i, "alias_ip_range", {})
    }] : []
    content {
      network    = network_interface.value.network_name
      subnetwork = network_interface.value.subnetwork_name
      network_ip = network_interface.value.network_ip
      dynamic "access_config" {
        for_each = network_interface.value.external_ip_needed == true ? [for i in network_interface.value.access_config : {
          nat_ip                 = lookup(i, "nat_ip", null)
          public_ptr_domain_name = lookup(i, "public_ptr_domain_name", null)
          network_tier           = lookup(i, "network_tier", null)
        }] : []
        content {
          nat_ip                 = access_config.value.nat_ip
          public_ptr_domain_name = access_config.value.public_ptr_domain_name
          network_tier           = access_config.value.network_tier
        }
      }
      dynamic "alias_ip_range" {
        for_each = length(network_interface.value.alias_ip_range) != 0 ? [{
          ip_cidr_range                 = lookup(network_interface.value.alias_ip_range, "ip_cidr_range", null)
          subnetwork_range_name = lookup(network_interface.value.alias_ip_range, "subnetwork_range_name", null)
        }] : []
        content {
          ip_cidr_range                 = alias_ip_range.value.ip_cidr_range
          subnetwork_range_name = alias_ip_range.value.subnetwork_range_name
        }
      }
    }
  }

  dynamic "shielded_instance_config" {
    for_each = length(var.shielded_instance_config) != 0 ? [{
      enable_secure_boot             = lookup(var.shielded_instance_config, "enable_secure_boot", false)
      enable_vtpm              = lookup(var.shielded_instance_config, "enable_vtpm", true)
      enable_integrity_monitoring     = lookup(var.shielded_instance_config, "enable_integrity_monitoring", true)
    }] : []
    content {
      enable_secure_boot             = shielded_instance_config.value.enable_secure_boot
      enable_vtpm             = shielded_instance_config.value.enable_vtpm
      enable_integrity_monitoring = shielded_instance_config.value.enable_integrity_monitoring
    }
  }

  dynamic "service_account" {
    for_each = length(var.service_account) != 0 ? [{
      email             = lookup(var.service_account, "email", false)
      scopes              = lookup(var.service_account, "scopes", null)
    }] : []
    content {
      email             = service_account.value.email
      scopes             = service_account.value.scopes == null ? local.scopes : service_account.value.scopes
    }
  }
}

