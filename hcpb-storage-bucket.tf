resource "boundary_storage_bucket" "boundary_aws_bucket" {
  name = "hcpb-session-recording-bucket"
  //description     = "Session Recording Storage Bucket - TF"
  scope_id        = "global"
  plugin_name     = "aws"
  bucket_name     = "boundary-s3-bucket"
  attributes_json = jsonencode({ "region" = "eu-west-2", "disable_credential_rotation" = true })

  secrets_json = jsonencode({
    "access_key_id"     = var.aws_access,
    "secret_access_key" = var.aws_secret
  })
  worker_filter = " \"sm-ingress-upstream-worker1\" in \"/tags/type\" "

}
/* Add a time_sleep to ensure that the Boundary worker has time to register with the controllers
and be in an active state. The boundary_storage_bucket needs to have an active worker when
you configure the worker_filter to specify which target you wish to use. If you do not have
an active worker, the build will fail
*/
resource "time_sleep" "wait_for_ingress_worker" {
  create_duration = "2m"

  depends_on = [aws_instance.boundary_ingress_worker]
}