resource "oci_core_vlan" "core_vlans" {
  for_each = var.core_vlans

  cidr_block          = each.value.cidr_block
  compartment_id      = each.value.compartment_id
  vcn_id              = each.value.vcn_id
  availability_domain = each.value.availability_domain
  defined_tags        = each.value.defined_tags
  display_name        = each.value.display_name
  freeform_tags       = each.value.freeform_tags
  nsg_ids             = each.value.nsg_ids
  route_table_id      = each.value.route_table_id
  vlan_tag            = each.value.vlan_tag

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

