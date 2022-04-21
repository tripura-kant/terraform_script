variable "project_id" {
  type = string
}

variable "instance_name" {
  type        = string
  description = "Name of the compute instance"
}

variable "machine_type" {
  type        = string
  description = "Machine type to use"
}

variable "allow_stopping_for_update" {
  type        = bool
  description = "If instances are allowed to stop for an update"
}

variable "attached_disk" {
  type = list(map(string))
  default = []
}

variable "zone_name" {
  type        = string
  description = "Zone for the compute instance"
}

variable "network_interface" {
  type = list(object({
    network_name       = string
    subnetwork_name    = string
    network_ip         = string
    external_ip_needed = bool
    access_config      = list(map(string))
    alias_ip_range = map(string)
  }))
  default = [{
    network_name       = null
    subnetwork_name    = null
    network_ip         = null
    external_ip_needed = false
    access_config      = []
    alias_ip_range = {}
  }]
}

variable "tags" {
  type        = list(string)
  description = "List of network tags"
  default     = []
}

variable "boot_disk" {
  type = map(string)
  default = {}
}


variable "description" {
  type        = string
  description = "description for the compute instance"
  default     = "Compute Instance"
}

variable "labels" {
  description = "Resource labels."
  type        = map(string)
  default     = {}
}

variable "metadata_list" {
  description = "list of metadata to add project wide, key,value pair"
  type        = map(string)
  default     = {}
}


variable "can_ip_forward" {
  type        = bool
  description = "Whether to allow sending and receiving of packets with non-matching source or destination IPs"
  default     = false
}

variable "deletion_protection" {
  type        = bool
  description = "To enable or disable deletion protection"
  default     = false
}

variable "shielded_instance_config" {
  type = map(string)
  default = {}
}

variable "service_account" {
  type = object({
    email = string
    scopes = list(string)
  })
  default = {
    email = null
    scopes = null
  }
}