# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: BUSL-1.1

# Full configuration options can be found at https://developer.hashicorp.com/vault/docs/configuration

ui = true

#mlock = true
#disable_mlock = true

storage "file" {
  path = "/opt/vault/data"
}

#storage "consul" {
#  address = "127.0.0.1:8500"
#  path    = "vault"
#}

# HTTP listener
#listener "tcp" {
#  address = "127.0.0.1:8200"
#  tls_disable = 1
#}

# HTTPS listener
listener "tcp" {
  address         = "127.0.0.1:8200"
  tls_min_version = "tls13"
  tls_cert_file   = "/opt/vault/tls/tls.crt"
  tls_key_file    = "/opt/vault/tls/tls.key"
}

# Enterprise license_path
# This will be required for enterprise as of v1.8
#license_path = "/etc/vault.d/vault.hclic"

# Example AWS KMS auto unseal
#seal "awskms" {
#  region = "us-east-1"
#  kms_key_id = "REPLACE-ME"
#}

# Example HSM auto unseal
#seal "pkcs11" {
#  lib            = "/usr/lib/softhsm/libsofthsm2.so"
#  pin            = "4321"
#  slot           = "123456789"
#  token_label    = "Vault"
#  key_label      = "vault-root-key-rsa"
#  key_id         = "01"
#  mechanism      = "CKM_RSA_PKCS_OAEP"
#  rsa_oaep_hash  = "sha1"
#}
