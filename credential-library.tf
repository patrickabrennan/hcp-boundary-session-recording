//A native Boundary static credential store
resource "boundary_credential_store_static" "static_cred_store" {
  name        = "static_credential_store"
  description = "Boundary Static Credential Store"
  scope_id    = boundary_scope.project.id
}

resource "boundary_credential_ssh_private_key" "static_ssh_key" {
  credential_store_id = boundary_credential_store_static.static_cred_store.id
  private_key         = file("../boundary.pem")
  username            = "ec2-user"
}