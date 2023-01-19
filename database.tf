resource "azurerm_postgresql_database" "this" {
  for_each = {for database in var.databases: database.id => database}
  name                = "${each.value.name}"
  server_name         = azurerm_postgresql_server.this.name
  resource_group_name = var.resource_group_name
  charset             = "${each.value.charset}"
  collation           = "${each.value.collation}"
 }