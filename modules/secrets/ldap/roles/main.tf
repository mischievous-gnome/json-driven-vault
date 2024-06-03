locals {

  ldap_static_roles  = var.ldap_static_roles
  ldap_dynamic_roles = var.ldap_dynamic_roles

}

resource "vault_ldap_secret_backend_static_role" "role" {
  for_each = local.ldap_static_roles 

  depends_on = [vault_ldap_secret_backend.config]

  role_name             = lookup(each.value, "role_name")
  rotation_period       = lookup(each.value, "rotation_period")
  username              = lookup(each.value, "username")

  dn                    = lookup(each.value, "dn", null)
  mount                 = lookup(each.value, "mount", null)
  namespace             = lookup(each.value, "namespace", null)
  skip_import_rotation  = lookup(each.value, "skip_import_rotation", null)

}

resource "vault_ldap_secret_backend_dynamic_role" "role" {
  for_each = local.ldap_dynamic_roles

  depends_on = [vault_ldap_secret_backend.config]

  creation_ldif     = lookup(each.value, "creation_ldif")
  deletion_ldif     = lookup(each.value, "deletion_ldif")
  role_name         = lookup(each.value, "role_name")

  default_ttl       = lookup(each.value, "default_ttl", null)
  max_ttl           = lookup(each.value, "max_ttl", null)
  mount             = lookup(each.value, "mount", null)
  namespace         = lookup(each.value, "namespace", null)
  rollback_ldif     = lookup(each.value, "rollback_ldif", null)
  username_template = lookup(each.value, "username_template", null)

}
