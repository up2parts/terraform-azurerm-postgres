variable "name" {
  description = "Specifies the name of the PostgreSQL Server."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the PostgreSQL Server."
}
variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
}
variable "sku_name" {
  description = "Specifies the SKU Name for this PostgreSQL Server."
}
variable "db_version" {
  description = "Specifies the version of PostgreSQL to use."
}
variable "administrator_login" {
  description = "The Administrator login for the PostgreSQL Server."
}
variable "storage_mb" {
  description = "Max storage allowed for a server."
}
variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
}
variable "geo_redundant_backup_enabled" {
  description = "This allows you to choose between locally redundant or geo-redundant backup storage."
}
variable "auto_grow_enabled" {
  description = "Storage auto-grow prevents your server from running out of storage and becoming read-only."
}
variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this server."
  default     = true 
}
variable "ssl_enforcement_enabled" {
  description = "Specifies if SSL should be enforced on connections."
  default     = true
}
variable "ssl_minimal_tls_version_enforced" {
  description = "The minimum TLS version to support on the server."
  default     = "TLS1_2"
}
variable "databases" {
  type    = list(object({
    id = string
    name = string
    charset = string
    collation = string
  }))
  description = "Definition of databases"
}
variable "firewall_rules" {
  type          = list(object({
    name        = string
    start_ip_address  = string
    end_ip_address  = string
  }))
  description = "Definition of firewall rules"
}
variable "postgresql_configuration" {
  type    = list(object({
    name = string
    value = string
  }))
  description = "Definition of configs"
  default = []
}
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}