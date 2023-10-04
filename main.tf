terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.60.0"
    }
    boundary = {
      source  = "hashicorp/boundary"
      version = ">=1.0.7"
    }
    http = {
      source  = "hashicorp/http"
      version = ">=3.2.1"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = ">=2.3.2"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = ">=0.56.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">=4.0.4"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "boundary" {
  # Use variables to provide values for the provider configuration
  addr                   = var.boundary_addr
  auth_method_id         = var.auth_method_id
  auth_method_login_name = var.password_auth_method_login_name
  auth_method_password   = var.password_auth_method_password

}