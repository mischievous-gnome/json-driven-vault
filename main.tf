locals {
 
  ldap    = [for fn in fileset("${var.ldap_secrets_data}","ldap-secrets-*.json") : jsondecode(file("${var.ldap_secrets_data}/${fn}"))]
  kvv2    = [for fn in fileset("${var.kvv2_secrets_data}","kvv2-secrets-*.json") : jsondecode(file("${var.kvv2_secrets_data}/${fn}"))]
  k8s     = [for fn in fileset("${var.k8s_secrets_data}","k8s-secrets-*.json") : jsondecode(file("${var.k8s_secrets_data}/${fn}"))]
  generic = [for fn in fileset("${var.generic_secrets_data}","generic-secrets-*.json") : jsondecode(file("${var.generic_secrets_data}/${fn}"))]
  consul  = [for fn in fileset("${var.consul_secrets_data}","consul-secrets-*.json") : jsondecode(file("${var.consul_secrets_data}/${fn}"))]


}

module "ldap_secrets" {
  source = "./modules/secrets/ldap"

  ldap_config        = try(merge({for k,v in flatten([for fn in local.ldap : fn.config]) : v.path => v}), {})
  ldap_static_roles  = try(merge({for k,v in flatten([for fn in local.ldap : fn.roles.static_roles]) : v.role_name => v}), null)
  ldap_dynamic_roles = try(merge({for k,v in flatten([for fn in local.ldap : fn.roles.dynamic_roles]) : v.role_name => v}), null)
  ldap_library_set   = try(merge({for k,v in flatten([for fn in local.ldap : fn.roles.library_set]) : v.role_name => v}), null)

}

module "kvv2_secrets" {
  source = "./modules/secrets/kvv2"

  kvv2_config = try(merge({for k,v in flatten([for fn in local.kvv2: fn.config]) : v.path => v}), {})

}

module "kubernetes_secrets" {
  source = "./modules/secrets/k8s"

  k8s_config = try(merge({for k,v in flatten([for fn in local.k8s: fn.config]) : v.path => v}), {})
  k8s_roles  = try(merge({for k,v in flatten([for fn in local.k8s: fn.roles]) : v.name => v}), {})

}

module "generic_vault_secrets" {
  source = "./modules/secrets/generic_vault_mount"

  generic_mount_config = try(merge({for k,v in flatten([for fn in local.generic : fn.config]) : v.path => v}), {})

}

module "consul_secrets" {
  source = "./modules/secrets/consul"

  consul_config = try(merge({for k,v in flatten([for fn in local.consul : fn.config]) : v.path => v}), {})
  consul_roles  = try(merge({for k,v in flatten([for fn in local.consul : fn.roles]) : v.name => v}), {})

}

