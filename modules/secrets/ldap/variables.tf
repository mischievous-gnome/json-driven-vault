variable "ldap_config" {
  description = "JSON object of LDAP secret mounts"
  type        = map
}

variable "ldap_static_roles" {
  description = "JSON object of LDAP static secret roles"
  type        = map
}  

variable "ldap_dynamic_roles" {
  description = "JSON object of LDAP dynamic secret roles"
  type        = map
}

variable "ldap_library_set" {
  description = "JSON object of LDAP library set service accounts"
  type        = map
}


