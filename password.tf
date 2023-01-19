resource "random_password" "this" {
  length           = 25
  special          = true
  override_special = "_%@"
}