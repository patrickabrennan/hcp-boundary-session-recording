//Create a periodic, orphan token for Boundary with the attached policies
resource "vault_token" "boundary_vault_token" {
  display_name = "boundary-token"
  policies     = ["boundary-controller", "ssh-policy"]
  no_parent    = true
  renewable    = true
  ttl          = "24h"
  period       = "24h"
}

//A native Boundary static credential store
resource "boundary_credential_store_static" "static_cred_store" {
  name        = "static_credential_store"
  description = "Boundary Static Credential Store"
  scope_id    = boundary_scope.project.id
}

4-10-2024 #removed static key as using Vault 
#resource "boundary_credential_ssh_private_key" "static_ssh_key" {
#  credential_store_id = boundary_credential_store_static.static_cred_store.id
#  private_key         = file("../boundary.pem")
#  username            = "ec2-user"
#}

//Credential store for Vault
resource "boundary_credential_store_vault" "vault_cred_store" {
  name        = "boudary-vault-credential-store"
  description = "Vault Credential Store"
  address     = var.vault_addr
  token       = vault_token.boundary_vault_token.client_token
  namespace   = "admin"
  scope_id    = boundary_scope.project.id

  depends_on = [vault_token.boundary_vault_token]
}

//Credential library for SSH injected credentials
resource "boundary_credential_library_vault_ssh_certificate" "vault_ssh_cert" {
  name                = "ssh-certs"
  description         = "Vault SSH Cert Library"
  credential_store_id = boundary_credential_store_vault.vault_cred_store.id
  path                = "ssh-client-signer/sign/boundary-client"
  //username            = "ec2-user"
  //username = vault_ssh_secret_backend_role.ssh_role.default_user
  username = "ec2-user"
}
