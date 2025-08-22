path "intermediate*" {
  capabilities = ["read", "list"]
}

path "intermediate/sign/*" {
  capabilities = ["create", "update"]
}

path "intermediate/issue/*" {
  capabilities = ["create"]
}
