locals {
  config = { for k,v in var.generic_mount_config: k => v.config }

}

resource "vault_mount" "secret" {
  for_each = local.config

  allowed_managed_keys         = lookup(each.value, "allowed_managed_keys", null)
  audit_non_hmac_response_keys = lookup(each.value, "audit_non_hmac_reponse_keys", null)
  default_lease_ttl_seconds    = lookup(each.value, "default_lease_ttl_seconds", null)
  description                  = lookup(each.value, "description", null)
  external_entropy_access      = lookup(each.value, "external_entropy_access", null)
  local                        = lookup(each.value, "local", null)
  max_lease_ttl_seconds        = lookup(each.value, "max_lease_ttl_seconds", null)
  namespace                    = lookup(each.value, "namespace", null)
  options                      = lookup(each.value, "options", null)
  path                         = lookup(each.value, "path")
  seal_wrap                    = lookup(each.value, "seal_wrap", null)
  type                         = lookup(each.value, "type")
}

