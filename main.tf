data "oci_operator_access_control_operator_controls" "operator_access_control_operator_controls_lookup" {
  for_each = var.operator_access_control_operator_controls_lookup

  compartment_id = each.value.compartment_id
  display_name   = each.value.display_name
  resource_type  = each.value.resource_type
  state          = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

