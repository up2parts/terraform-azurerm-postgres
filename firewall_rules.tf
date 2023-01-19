resource "azurerm_postgresql_firewall_rule" "this" {
  for_each = {for rule in var.firewall_rules: rule.name => rule}
  name                = "${each.value.name}"
  server_name         = azurerm_postgresql_server.this.name
  resource_group_name = var.resource_group_name
  start_ip_address    = "${each.value.start_ip_address}"
  end_ip_address      = "${each.value.end_ip_address}"
}