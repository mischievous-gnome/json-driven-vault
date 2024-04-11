locals {
  ldap_secrets_engine       = fileset("${var.ldap_secrets_data}","*.json")
  kvv2_secrets_engine       = fileset("${var.kvv2_secrets_data}","*.json")
  kubernetes_secrets_engine = fileset("${var.kubernetes_secrets_data}","*.json")
  generic_mount_engine      = fileset("${var.generic_secrets_data}","*.json")
  consul_secrets_engine     = fileset("${var.consul_secrets_data}","*.json")
}

module "ldap_secrets_engine" {
  source = "./modules/secrets/ldap"

  ldap_config = {for k,v in local.ldap_secrets_engine: k => jsondecode(file("${var.ldap_secrets_data}/${v}"))}
}

module "kvv2_secrets_engine" {
  source = "./modules/secrets/kvv2"

  kv_config = {for k,v in local.kvv2_secrets_engine: k => jsondecode(file("${var.kvv2_secrets_data}/${v}"))}
}

module "kubernetes_secrets_engine" {
  source = "./modules/secrets/k8s"

  kubernetes_config = {for k,v in local.kubernetes_secrets_engine: k => jsondecode(file("${var.kubernetes_secrets_data}/${v}"))}
}

module "generic_vault_mount" {
  source = "./modules/secrets/generic_vault_mount"

  generic_mount_config = {for k,v in local.generic_mount_engine: k => jsondecode(file("${var.generic_secrets_data}/${v}"))}
}

module "consul_secrets_engine" {
  source = "./modules/secrets/consul"

  consul_config = {for k,v in local.consul_secrets_engine: k => jsondecode(file("${var.consul_secrets_data}/${v}"))}
}

