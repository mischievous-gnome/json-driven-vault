locals {
  roles = var.k8s_roles
}

resource "vault_kubernetes_secret_backend_role" "roles" {
  for_each = local.roles

  depends_on = [vault_kubernetes_secret_backend.config]

  
  backend                               = lookup(each.value, "backend")
  name                                  = lookup(each.value, "name")
 
  allowed_kubernetes_namespaces         = lookup(each.value, "allowed_kuberntes_namespaces", null)
  allowed_kubernetes_namespace_selector = lookup(each.value, "allowed_kuberntes_namespaces", null)
  extra_labels                          = lookup(each.value, "extra_labels", null) 
  extra_annotations                     = lookup(each.value, "extra_annotations", null)
  generated_role_rules                  = lookup(each.value, "generated_role_rules", null)
  kubernetes_role_name                  = lookup(each.value, "kubernetes_role_name", null)
  name_template                         = lookup(each.value, "name_template", null)
  service_account_name                  = lookup(each.value, "service_account_name", null)
  token_default_ttl                     = lookup(each.value, "token_default_ttl", null)
  token_max_ttl                         = lookup(each.value, "token_max_ttl", null) 
  

}

