locals {
  config = var.kvv2_config
}

resource "vault_mount" "kvv2" {
  for_each = local.config

  path  = lookup(each.value, "path")
  type  = "kv"
  options = { version = "2" }
}

resource "vault_kv_secret_backend_v2" "kvv2" {
  for_each   = local.config
  depends_on = [vault_mount.kvv2]

  cas_required         = lookup(each.value, "cas_required", null) 
  delete_version_after = lookup(each.value, "delete_version_after", null)
  max_versions         = lookup(each.value, "max_versions", null)
  mount                = lookup(each.value, "path", null) 
  namespace            = lookup(each.value, "namespace", null)

}
