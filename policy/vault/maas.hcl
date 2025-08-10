path "auth/approle/role/maas/secret-id" {
  capabilities = [ "update" ]
}

path "maas/metadata" {
	capabilities = [ "list" ]
}

path "maas/metadata/*" {
	capabilities = [ "read", "update", "delete", "list" ]
}

path "maas/data/*" {
	capabilities = [ "read", "create", "update", "delete" ]
}
