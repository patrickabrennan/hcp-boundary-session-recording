#Reguired fields:
boundary_addr = "https://d51e31f7-d625-4eb6-b098-9dbbe623c26a.boundary.hashicorp.cloud"
auth_method_id = "ampw_xxxxxxxxxx"
password_auth_method_login_name = "admin"
password_auth_method_password = "PatisTesting!"
aws_vpc_cidr = "10.0.0.0/16"
aws_subnet_cidr = "10.1.0.0/24"

#Fill out if not using 'role_arn'
aws_access = ""
aws_secret = ""

vault_addr = "https://Pat-Brennan-SE-East-vault-cluster-public-vault-01691920.0ac6f10f.z1.hashicorp.cloud:8200"
role_arn = "arn:aws:iam::285942769742:role/tfc-workload-identity" 
web_identity_token_file = "identity_token.aws.jwt_filename"

#Change to effect defualts set in variables.tf file
aws_region = "us-east-2"
availability_zone = "us-east-2a"
s3_bucket_name = "boundary-test-s3-bucket"
s3_bucket_name_tags = "Session-Recording"
s3_bucket_env_tags = "Boundary"
instances = "boundary-1-dev"
vm_tags = { "Name" : "boundary-1-dev", "service-type" : "database", "application" : "dev" }
