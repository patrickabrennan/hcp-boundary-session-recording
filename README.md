# HashiCorp Boundary Session Recording

![HashiCorp Boundary Logo](https://www.hashicorp.com/_next/static/media/colorwhite.997fcaf9.svg)

## Overview

HashiCorp Boundary is a secure and efficient way to access distributed infrastructure. It provides secure access to SSH, RDP, and HTTP(S) resources, without the need for VPNs or exposing the infrastructure to the public internet.

This README file explains how to set up session recording for HCP Boundary

## Session Recording

The session recording deployment in this repo has been setup as follows:

1. Configure HCP Boundary.
2. Deploy a Boundary Worker in a public network.
3. Establish a connection between the Boundary Controller and the Boundary Workers.
4. Deploy an AWS S3 bucket for the session recording
5. Configure the Boundary Storage Bucket in the Boundary UI
6. Deploy a server instance in a public subnet. 

Your HCP Boundary Cluster needs to be created prior to executing the Terraform code. For people new to HCP, a trial can be utilised, which will give $50 credit to try, which is ample to test this solution.

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
