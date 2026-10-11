variable "core_vlans" {
  description = <<EOT
Map of core_vlans, attributes below
Required:
    - cidr_block
    - compartment_id
    - vcn_id
Optional:
    - availability_domain
    - defined_tags
    - display_name
    - freeform_tags
    - nsg_ids
    - route_table_id
    - vlan_tag
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    cidr_block          = string
    compartment_id      = string
    vcn_id              = string
    availability_domain = optional(string)
    defined_tags        = optional(map(string))
    display_name        = optional(string)
    freeform_tags       = optional(map(string))
    nsg_ids             = optional(set(string))
    route_table_id      = optional(string)
    vlan_tag            = optional(number)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

