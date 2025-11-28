# tf-clouds

Purpose: create S3 bucket with lifecycle to Glacier, upload sample file, create VPC, subnet and security group using Terraform. Designed to be run in Jenkins pipelines.

## Pre-reqs
- Jenkins with AWS service account credentials configured. Example credentialsId: `aws-creds`
- Terraform 1.0+ installed on Jenkins agents
- AWS CLI on Jenkins agent (for post-deploy checks)
- Repository checked out by Jenkins

## How to run locally (quick)
