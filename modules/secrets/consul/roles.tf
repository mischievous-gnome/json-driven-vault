locals {
  roles = var.consul_roles
}

resource "vault_consul_secret_backend_role" "role" {
  for_each = local.roles

  depends_on = [vault_consul_secret_backend.consul]

  name               = lookup(each.value, "name")
  backend            = lookup(each.value, "backend")

  namespace          = lookup(each.value, "namesapce", null) 
  consul_policies    = lookup(each.value, "consul_policies", null)
  consul_roles       = lookup(each.value, "consul_roles", null)
  service_identities = lookup(each.value, "service_identites", null) 
  node_identities    = lookup(each.value, "node_identites", null)
  consul_namespace   = lookup(each.value, "consul_namespace", null)
  partition          = lookup(each.value, "partition", null)
  max_ttl            = lookup(each.value, "max_ttl", null)
  ttl                = lookup(each.value, "ttl", null)
  local              = lookup(each.value, "local", null)

}

