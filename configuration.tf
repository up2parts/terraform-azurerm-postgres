resource "azurerm_postgresql_configuration" "this" {
  for_each = {for config in var.postgresql_configuration: config.name => config}
	name                = "${each.value.name}"
	server_name         = azurerm_postgresql_server.this.name
	resource_group_name = var.resource_group_name
	value               = "${each.value.value}"
  }
