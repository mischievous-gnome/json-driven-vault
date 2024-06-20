variable "ldap_secrets_data" {
  description = "Location of LDAP files for LDAP secrets mount"
  default     = "data/secrets/ldap"
}

variable "kvv2_secrets_data" {
  description = "Location of KVV2 files for KVV2 secrets mounts"
  default     = "data/secrets/kvv2"
}

variable "k8s_secrets_data" {
  description = "Location of Kubernetes files for Kubernetes secrets mounts"
  default     = "data/secrets/k8s"
}

variable "generic_secrets_data" {
  description = "Location of files for generic Vault secrets mounts"
  default     = "data/secrets/generic_vault_mount"
}

variable "consul_secrets_data" {
  description = "Location of files for generic Vault secrets mounts"
  default     = "data/secrets/consul"
}


