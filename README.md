# terraform-azurerm-postgres
Creates a PostgreSQL server in Azure.
#### Parameters to pass
| Parameters | Need | Description
| ------ | ------ | ------ |
name|(Required)|Specifies the name of the PostgreSQL Server
resource_group_name|(Required)|The name of the resource group in which to create the PostgreSQL Server
location|(Required)|Specifies the supported Azure location where the resource exists
sku_name|(Required)|Specifies the SKU Name for this PostgreSQL Server. Possible values are `B_Gen4_1`, `B_Gen4_2`, `B_Gen5_1`, `B_Gen5_2`, `GP_Gen4_2`, `GP_Gen4_4`, `GP_Gen4_8`, `GP_Gen4_16`, `GP_Gen4_32`, `GP_Gen5_2`, `GP_Gen5_4`, `GP_Gen5_8`, `GP_Gen5_16`, `GP_Gen5_32`, `GP_Gen5_64`, `MO_Gen5_2`, `MO_Gen5_4`, `MO_Gen5_8`, `MO_Gen5_16` and `MO_Gen5_32`.
db_version|(Required)|Specifies the version of PostgreSQL to use. Possible values are `9.5`, `9.6`, `10`, `10.0`, `10.2` and `11`
administrator_login|(Required)|The Administrator login for the PostgreSQL Server
storage_mb|(Required)|Max storage allowed for a server
backup_retention_days|(Required)|Backup retention days for the server, supported values are between `7` and `35` days
geo_redundant_backup_enabled|(Required)|This allows you to choose between locally redundant or geo-redundant backup storage
auto_grow_enabled|(Required)|Storage auto-grow prevents your server from running out of storage and becoming read-only
public_network_access_enabled|(Optional)|Whether or not public network access is allowed for this server. Defaults to `true`
ssl_enforcement_enabled|(Optional)|Specifies if SSL should be enforced on connections. Defaults to `true`
ssl_minimal_tls_version_enforced|(Optional)|The minimum TLS version to support on the server. Defaults to `TLS1_2`
databases|(Optional)|Definition of databases
firewall_rules|(Optional)|Definition of firewall rules
postgresql_configuration|(Optional)|Definition of PostgreSQL config parameters
tags|(Optional)|A mapping of tags to assign to the resource


#### Usage:
```hcl
module "mypostgresql" {
  source                       = "github.com/up2parts/terraform-azurerm-postgres?ref=1.0.0"
  name                         = "mypostgresqlserver"
  resource_group_name          = "myresourcegroup"
  location                     = "westeurope"
  sku_name                     = "B_Gen5_2"
  db_version                   = "11"
  administrator_login          = "someusername"
  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  tags                         = {
    Environment   = "a"
    Organization  = "b"
    Project       = "c"
  }
  postgresql_configuration     = [
  {
    name  = "pg_stat_statements.track"
    value = "ALL"
  }]
  databases                    = [
  {
    id          = "arandomstringorid1"
    name        = "firstdb", 
    charset     = "UTF8", 
    collation   = "English_United States.1252"
  },
  {
    id          = "arandomstringorid2"
    name        = "seconddb", 
    charset     = "UTF8", 
    collation   = "English_United States.1252"
  }]
  firewall_rules    = [
  {
    name                = "servera", 
    start_ip_address    = "111.111.111.111",
    end_ip_address      = "111.111.111.111"
  },
  {
    name                = "serverb", 
    start_ip_address    = "222.222.222.222",
    end_ip_address      = "222.222.222.222"
  }]
}
```
