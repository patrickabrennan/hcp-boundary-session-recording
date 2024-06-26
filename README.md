# HashiCorp Boundary Session Recording

![HashiCorp Boundary Logo](https://www.hashicorp.com/_next/static/media/colorwhite.997fcaf9.svg)

## Overview

HashiCorp Boundary is a secure and efficient way to access distributed infrastructure. It provides secure access to SSH, RDP, and HTTP(S) resources, without the need for VPNs or exposing the infrastructure to the public internet.

SSH recording is only available when the target type is set to `ssh`, which means that the credentials are injected. If you are not using Vault to provide dynamic SSH credentials, you can utilise Boundary's static credential store, reference a static username and `.pem` file and have that injected into your session. This repo demonstates Boundary's ability to use application credential injection, leveraging Vault. There are also credential stores created for Boundary's native credential store.

This README file explains how to set up session recording for HCP Boundary

## Session Recording

The session recording deployment in this repo has been setup as follows:

1. Configure HCP Boundary.
2. Configure HCP Vault.
3. Deploy a Boundary Worker in a public network.
4. Establish a connection between the Boundary Controller and the Boundary Workers.
5. Deploy an AWS S3 bucket for the session recording
6. Configure the Boundary Storage Bucket in the Boundary UI
7. Deploy a server instance in a public subnet. 

The `variables.tf` file has the region set to eu-west-2 (London). Please change this to the region of your choice, along with the appropriate CIDR ranges.

Your HCP Boundary and Vault clusters need to be created prior to executing the Terraform code. For people new to HCP, a trial can be utilised, which will give $50 credit to try, which is ample to test this solution.

## tfvars Variables

The following tfvars variables have been defined in a terraform.tfvars file.

- `boundary_addr`: The HCP Boundary address, e.g. "https://xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.boundary.hashicorp.
cloud"
- `auth_method_id`: "ampw_xxxxxxxxxx"                             
- `password_auth_method_login_name`: = ""
- `password_auth_method_password`:   = ""
- `aws_vpc_cidr`:                    = ""
- `aws_subnet_cidr`:                 = ""
- `aws_access`:                      = ""
- `aws_secret`:                      = ""
- `vault_addr`:                      = ""
