locals {
  config = { for k,v in var.consul_config: k => v.config }
}

resource "vault_consul_secret_backend" "consul" {
  for_each = local.config

  address                   = lookup(each.value, "address")
  bootstrap		    = lookup(each.value, "bootstrap", null)
  ca_cert                   = lookup(each.value, "ca_cert", null)
  client_cert               = lookup(each.value, "client_cert",null)
  client_key                = lookup(each.value, "client_key",null)
  default_lease_ttl_seconds = lookup(each.value, "default_lease_ttl_seconds",null)
  description               = lookup(each.value, "description",null)
  disable_remount           = lookup(each.value, "disable_remount", null)
  local                     = lookup(each.value, "local",null)
  max_lease_ttl_seconds     = lookup(each.value, "max_lease_ttl_seconds",null)
  namespace                 = lookup(each.value, "namespace", null)
  path                      = lookup(each.value, "path", null)
  scheme                    = lookup(each.value, "scheme",null)
  token                     = lookup(each.value, "token", null)

}
