# **Network**

```
This modules makes it easy to set up a new VPC Network in GCP by defining your network and subnet ranges in a concise syntax.

It supports creating:

1. A Google Virtual Private Network (VPC)
2. Subnets within the VPC
3. Secondary ranges for the subnets (if applicable)

Sub modules are provided for creating individual vpc, subnets, and routes. See the modules directory for the various sub modules usage.
```
For any links specify as - [link name](https://www.example.com/my%20great%20page)


## **Usage**

```
Specify the code here



```

## **Inputs**

| **Name** | **Description** | **Type** | **Required** | **Default** |
|----------|-----------------|----------|:------------:|:-----------:|
| project_id | The ID of the project where subnets will be created | `string` | yes |n/a |
| subnets | The list of subnets being created | `list(map(string))` |yes  |n/a |
| secondary_ranges | Secondary ranges that will be used in some of the subnets | `map(list(object({ range_name = string, ip_cidr_range = string })))` | no |`{}` |
| network_name | The name of the network being created | `string` | no |`vpc-network` |
| routing_mode | The network routing mode | `string` | no |`GLOBAL` |


## **Ouputs**

| Name | Description |
|------|-------------|
| mod-networkid | The id of network created |
| mod-networkname | The name of the network |
| mod-subnets | The created subnet resources |

