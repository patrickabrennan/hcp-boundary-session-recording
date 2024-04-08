resource "boundary_auth_method" "password" {
  scope_id = "global"
  type     = "password"
}

resource "boundary_account_password" "danny" {
  auth_method_id = boundary_auth_method.password.id
  type           = "password"
  login_name     = "danny.knights"
  password       = "boundaryisgreat"
}

resource "boundary_user" "danny" {
  name        = "danny.knights"
  description = "Danny's user resource"
  account_ids = [boundary_account_password.danny.id]
  scope_id    = "global"
}

resource "boundary_role" "danny_role_global" {
  scope_id      = "global"
  principal_ids = [boundary_user.danny.id]
  grant_strings = ["ids=*;type=*;actions=*"]
}

resource "boundary_role" "danny_role_project" {
  scope_id      = boundary_scope.project.id
  principal_ids = [boundary_user.danny.id]
  grant_strings = ["ids=*;type=*;actions=*"]
}