path "pki*" {
  capabilities = ["read", "list"]
}

path "pki/sign/*" {
  capabilities = ["create", "update"]
}

path "pki/issue/*" {
  capabilities = ["create"]
}
