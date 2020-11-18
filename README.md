Terraform Lab - AWS Builds
------------

This repository contains Terraform code for depploying an AWS VPC with public and private subnets, an S3 bucket, 1 Nginx instance and 1 Windows Server instance. 

#### Prerequisites 

* AWS CLI installed and configured.
* Terraform CLI v0.13+ installed and configured.
* Create an S3 bucket and save the bucket name for later use. 

#### Deployment

Clone the repo to your local machine and perfrom the following changes before running Terraform: 

  * Open the **terraform.tfvars** file located at `terra-labs/primary` and replace the values for "Your own public IP" and "Your own Key Pair".
  
  * Open the **main.tf** file located at `terra-labs/primary` and at the bottom of the code, replace the "Your S3 bucket" with the name of the S3 buckket you have previously created.

  * Run `terraform init` in the following directories:
    * `terra-labs/modules/ec2`
    * `terra-labs/modules/vpc`
    * `terra-labs/modules/s3`
  * Then run it in the `terra-labs/primary` directory.  

#### Coding Standards

* Lint/Format Terraform with `terraform fmt`
* Validate Terraform with `terraform validate`
* Use checkov to scan vulnerabilities with `checkov -d your terraform directory`
* Use tfsec for scanning security vulnerabilities with Github actions