# **Google Compute Instance**

```
An instance is a virtual machine (VM) hosted on Google's infrastructure. You can create an instance by using the Google Cloud Console, the gcloud command-line tool, or the Compute Engine API.
```


## **Usage**
```
Specify the code here



```

## **Inputs**

| **Name** | **Description** | **Type** | **Required** | **Default** |
|----------|-----------------|----------|:------------:|:-----------:|
| project_id | The ID of the project in which the resource belongs | `string` | yes | n/a |
| instance_name | Name of the compute instance | `string` | yes | n/a |
| machine_type | Machine type to use | `string` | yes | n/a |
| allow_stopping_for_update | If instances are allowed to stop for an update | `bool` | no | `true` |
| additional_disk | The additional disk for the instance | `bool` | no | `false` |
| attached_disk | Additional disks to attach to the instance. Can be repeated multiple times for multiple disks | `list(object({`<br/>`source                  = string`<br/>`device_name             = string`<br/>`mode                    = string`<br/>`disk_encryption_key_raw = string`<br/>`kms_key_self_link       = string`<br/>`}))` | yes | n/a |
| zone_name | Zone for the compute instance | `string` | yes | n/a |
| external_ip_needed | Boolean to say if external IP is needed for the instance | `bool` | no  | `false`|
| network_interface | A network interface is the point of interconnection between a computer and a private or public network | `list(object({`<br/>`network_name       = string`<br/>`subnetwork_name    = string`<br/>`subnetwork_project = string`<br/>`network_ip         = string`<br/>`access_config = list(object({`<br/>  `nat_ip                 = string`<br/>  `public_ptr_domain_name = string`<br/>  `public_ptr_domain_name = string`<br/>  `network_tier           = string`<br/> `}))` | yes | n/a |  
| tags | List of network tags | `list(string)` | no  | `""` |
| boot_disk | A boot disk is a removable digital data storage medium from which a computer can load and run an operating system or utility program | `object({` <br/>`auto_delete             = bool`<br/>`device_name             = string`<br/>`mode                    = string`<br/>`disk_encryption_key_raw = string`<br/>`kms_key_self_link       = string`<br/>`initialize_params = object({`<br/>  `size  = number`<br/>`size  = number`<br/>`type  = string`<br/>`image = string`<br/>`})`<br/>`source = string`<br/>`})` | yes | n/a |
| description | description for the firewall | `string` | no | `Compute Instance`|
| labels | Resource labels | `map(string)` | no |`{}` |
| metadata_list | list of metadata to add project wide, key,value pair | `map(string)` | no |`{}` |
| can_ip_forward | Whether to allow sending and receiving of packets with non-matching source or destination IPs | `bool` | no | `false`|
| deletion_protection | To enable or disable deletion protection | `string` | no | `false`|


## **Ouputs**

| Name | Description |
|------|-------------|
|  |  |
|  |  |

