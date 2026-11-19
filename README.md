# Modular AWS Infrastructure with Terraform

A beginner-to-intermediate Terraform practical project that provisions reusable AWS infrastructure using modules, separate Dev and QA workspaces, and an S3 remote backend with native state locking.

## Project summary

- **Cloud:** AWS
- **Infrastructure as Code:** Terraform
- **Region used in the completed lab:** `eu-north-1`
- **Authentication profile:** `terraform-lab`
- **Environments:** `default`, `dev`, `qa`
- **Compute:** Two EC2 instances per environment (public and private)
- **Networking:** One VPC, public/private subnets, Internet Gateway, public route table
- **Storage:** An application S3 bucket per environment
- **State:** Versioned and encrypted S3 remote state; native S3 lockfile (`use_lockfile = true`)

## Architecture

```text
                         AWS Region: eu-north-1
                                  |
                             VPC per env
                         /                 \
                Public subnet           Private subnet
                     |                       |
              Public EC2                Private EC2
                     |                       |
              Public Security          Private Security
                  Group                     Group

             Application S3 bucket (per environment)

Separate bootstrap resources:
  - S3 remote-state bucket (versioning + AES-256 encryption + public access block)
  - DynamoDB table retained for legacy classroom discussion
```

The private subnet has no NAT Gateway or direct Internet route in this lab. The private EC2 instance therefore does not have direct outbound Internet access.

## Repository structure

```text
terraform-aws-modular-infrastructure/
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── backend.tf.example
├── terraform.tfvars.example
├── dev.tfvars.example
├── qa.tfvars.example
├── modules/
│   ├── networking/
│   ├── compute/
│   └── storage/
└── Tf-bootstrap/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```

## Prerequisites

1. Terraform CLI `>= 1.10.0`.
2. AWS CLI configured with a profile named `terraform-lab`.
3. An EC2 key pair named `terraform-lab-key` in `eu-north-1`.
4. AWS permissions to create the resources in this project.
5. A globally unique S3 bucket name for each application environment.
6. Your current public IPv4 CIDR in the format `x.x.x.x/32` for SSH ingress.

Do not commit AWS credentials, private keys, Terraform state files, or real `.tfvars` files to GitHub.

## Configure the project

Copy the example variable files and replace the placeholders:

```powershell
Copy-Item terraform.tfvars.example terraform.tfvars
Copy-Item dev.tfvars.example dev.tfvars
Copy-Item qa.tfvars.example qa.tfvars
```

Edit all three files:
- Set `admin_cidr` to your own public IP `/32`.
- Set globally unique `bucket_name` values.
- Confirm the EC2 key pair exists in `eu-north-1`.

## Bootstrap the remote backend

The bootstrap project creates the remote state bucket and a DynamoDB table retained for legacy learning.

```powershell
cd .\Tf-bootstrap
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
```

Record the generated S3 bucket name. Keep the bootstrap state safe.

## Configure S3 backend

From the repository root, copy `backend.tf.example` to `backend.tf`, then replace the bucket placeholder with the bucket created by the bootstrap project.

```powershell
Copy-Item backend.tf.example backend.tf
terraform init -migrate-state
```

The completed lab used S3 native locking with `use_lockfile = true`. DynamoDB-based S3 backend locking is a legacy approach; the table is retained only to reflect the course exercise.

## Deploy environments

Run commands from the root project directory.

### Default workspace

```powershell
terraform workspace select default
terraform init
terraform plan
terraform apply
```

### Dev workspace

```powershell
terraform workspace select dev
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

### QA workspace

```powershell
terraform workspace select qa
terraform plan -var-file="qa.tfvars"
terraform apply -var-file="qa.tfvars"
```

Always pass the matching variable file for `dev` and `qa`. Terraform does not automatically select a matching `.tfvars` file based on workspace name.

## Useful verification commands

```powershell
terraform fmt -recursive
terraform validate
terraform workspace list
terraform state list
terraform output
terraform show
aws s3 ls s3://YOUR-STATE-BUCKET --recursive --profile terraform-lab
```

The completed lab verified that the default, dev, and qa workspace states were present in the S3 backend. The QA workspace contained 15 managed resources after the temporary locking resource was removed.

## State-locking demonstration

A temporary `time_sleep` resource was used to demonstrate state locking. Two Terraform terminals were opened against the same backend and QA workspace. The temporary resource was applied, then the second terminal ran an apply with `-lock-timeout=2m`. The second operation found no pending changes after it acquired the lock. The temporary resource was subsequently removed from configuration and state.

The demonstration confirmed that Terraform used the shared remote backend and locking mechanism. The second terminal did not visibly wait in the captured output, so the evidence does not claim a measured wait interval.

## Validation evidence from the completed lab

- `terraform fmt -recursive` completed.
- `terraform validate` returned `Success! The configuration is valid.`
- `terraform workspace list` showed `default`, `dev`, and `qa`.
- S3 backend migration was completed for all three workspace states.
- QA state listed the networking, compute, and storage resources.
- The temporary `time_sleep` resource was no longer present in `terraform state list`.

## Cost and cleanup

EC2 instances in the completed lab were stopped. Stopped EC2 instances can still incur EBS storage and public IPv4 charges. Application resources should be destroyed when the lab is no longer needed.

Destroy environments one at a time, with a reviewed plan and the matching variable file:

```powershell
terraform workspace select qa
terraform plan -destroy -var-file="qa.tfvars"
terraform destroy -var-file="qa.tfvars"

terraform workspace select dev
terraform plan -destroy -var-file="dev.tfvars"
terraform destroy -var-file="dev.tfvars"
```

The default workspace requires its own reviewed destroy plan and the default variable values.

**Do not destroy the remote-state S3 bucket while it still contains state you need.** Keep the bootstrap project and its state until all application environments have been safely destroyed or migrated.

## Learning outcomes

This project demonstrates:
- Infrastructure as Code with Terraform.
- Reusable Terraform modules.
- AWS VPC networking and EC2 provisioning.
- S3 application storage and security controls.
- Environment separation with Terraform workspaces and variable files.
- S3 remote state, versioning, encryption, and native lockfile-based locking.
- Validation, planning, applying, state inspection, and cost-aware cleanup.

## Author / submission

Prepared as a practical Terraform and AWS infrastructure lab submission. Add your course name, student details, and screenshots before submitting if required by your instructor.
