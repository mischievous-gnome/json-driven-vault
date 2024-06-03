locals {
  config = var.k8s_config

}

resource "vault_kubernetes_secret_backend" "config" {
  for_each = local.config


  path                         = lookup(each.value, "path")

  allowed_managed_keys         = lookup(each.value, "allowed_managed_keys", null)
  audit_non_hmac_response_keys = lookup(each.value, "audit_non_hmac_reponse_keys", null)
  default_lease_ttl_seconds    = lookup(each.value, "default_lease_ttl_seconds", null)
  description                  = lookup(each.value, "description", null)
  disable_local_ca_jwt         = lookup(each.value, "disable_local_ca_jwt", null)
  external_entropy_access      = lookup(each.value, "external_entropy_access", null)
  kubernetes_ca_cert           = lookup(each.value, "kubernetes_ca_cert", null)
  kubernetes_host              = lookup(each.value, "kubernetes_host", null)
  local                        = lookup(each.value, "local", null)
  max_lease_ttl_seconds        = lookup(each.value, "max_lease_ttl_seconds", null)
  namespace                    = lookup(each.value, "namespace", null)
  options                      = lookup(each.value, "options", null)
  seal_wrap                    = lookup(each.value, "seal_wrap", null)
  service_account_jwt          = lookup(each.value, "service_account_jwt", null)
}
