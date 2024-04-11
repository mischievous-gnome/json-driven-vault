locals {
  config = { for k,v in var.ldap_config: k => v.config }
}

resource "vault_ldap_secret_backend" "config" {
  for_each = local.config

  binddn                           = lookup(each.value, "binddn")
  bindpass                         = lookup(each.value, "bindpass")
  certificate                      = lookup(each.value, "certifiate",null)
  connection_timeout               = lookup(each.value, "connection_timeout",null)
  client_tls_cert                  = lookup(each.value, "client_tls_cert",null)
  client_tls_key                   = lookup(each.value, "client_tls_key",null)
  default_lease_ttl_seconds        = lookup(each.value, "default_lease_ttl_seconds",null)
  description                      = lookup(each.value, "description",null)
  insecure_tls                     = lookup(each.value, "insecure_tls",null)
  local                            = lookup(each.value, "local",null)
  max_lease_ttl_seconds            = lookup(each.value, "max_lease_ttl_seconds",null)
  password_policy                  = lookup(each.value, "password_policy",null)
  path                             = lookup(each.value, "path", null)
  request_timeout                  = lookup(each.value, "request_timeout",null)
  starttls                         = lookup(each.value, "starttls",null)
  schema                           = lookup(each.value, "schema",null)
  upndomain                        = lookup(each.value, "upndomain",null)
  url                              = lookup(each.value, "url",null)
  userattr                         = lookup(each.value, "userattr",null)
  userdn                           = lookup(each.value, "userdn", null)
  skip_static_role_import_rotation = lookup(each.value, "skip_static_role_import_rotation", null)

}
