# resource "boundary_storage_bucket" "boundary_aws_bucket" {
#   name            = "hcpb-session-recording-bucket"
#   description     = "Session Recording Storage Bucket - TF"
#   scope_id        = boundary_scope.org.id
#   plugin_name     = "aws"
#   bucket_name     = "boundary-s3-bucket"
#   attributes_json = jsonencode({ "region" = "eu-west-2" })

#   secrets_json = jsonencode({
#     "access_key_id"     = var.aws_access,
#     "secret_access_key" = var.aws_secret
#   })
#   worker_filter = " \"sm-ingress-upstream-worker1\" in \"/tags/type\" "

#   depends_on = [aws_instance.boundary_ingress_worker]
# }