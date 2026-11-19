# Project Report: Modular AWS Infrastructure Using Terraform

**Prepared for:** Edversity practical project submission  
**Project type:** Infrastructure as Code (IaC)  
**Cloud platform:** Amazon Web Services (AWS)  
**Tool:** Terraform  
**Region:** Europe (Stockholm), `eu-north-1`

## 1. Objective

The objective was to build modular AWS infrastructure using Terraform, deploy separate environments, and configure remote state management with state locking.

## 2. Technologies

- Terraform CLI and HashiCorp AWS provider
- AWS VPC, subnets, Internet Gateway, route table and security groups
- Amazon EC2 and Amazon S3
- S3 remote backend with versioning, encryption and native S3 lockfile
- Terraform modules, variables, outputs and workspaces
- AWS CLI and PowerShell on Windows

## 3. Infrastructure design

The infrastructure was organized into three reusable modules:

- **Networking module:** VPC, public subnet, private subnet, Internet Gateway, public route table and route table association.
- **Compute module:** Public and private EC2 instances, plus separate security groups.
- **Storage module:** Application S3 bucket with versioning, server-side encryption and public-access blocking.

A separate bootstrap project provisioned the remote-state S3 bucket and a DynamoDB table retained for the legacy classroom exercise.

## 4. Environment separation

The same Terraform root configuration was reused for `default`, `dev` and `qa` workspaces. Separate variable files provided environment-specific CIDR ranges, names and bucket names. Each workspace maintained its own state in the S3 backend.

## 5. Remote state and locking

The main infrastructure project was migrated from local state to an S3 backend. The state bucket had versioning, AES-256 server-side encryption and public-access blocking enabled. The backend used `use_lockfile = true` for native S3 state locking.

A temporary `time_sleep` resource was used to demonstrate concurrent Terraform operations from two terminals. The temporary resource was removed after the demonstration.

## 6. Verification performed

The following checks were completed:

- `terraform fmt -recursive`
- `terraform validate` — returned `Success! The configuration is valid.`
- `terraform workspace list` — showed `default`, `dev` and `qa`.
- `terraform state list` — confirmed the QA networking, compute and storage resources were tracked.
- A state listing check confirmed that the temporary `time_sleep` resource was no longer present.
- S3 listing confirmed remote state objects for the default, dev and qa workspaces.

The QA state contained 15 managed resources after removal of the temporary demonstration resource. The original lab deployment had created 14 resources in each environment; the additional QA state entry is the EC2 data source, which is displayed by `terraform state list` but is not a billable AWS resource.

## 7. Cost and security considerations

The EC2 instances were stopped after deployment. Stopping an EC2 instance does not remove charges for attached EBS volumes and may not remove public IPv4 charges. The application environments should be destroyed when no longer needed, after reviewing the destroy plan. The remote-state bucket and bootstrap state must be retained until the remote state is no longer required.

No AWS credentials, private keys or Terraform state files should be committed to GitHub.

## 8. Learning outcomes

The project provided practical experience with modular Terraform design, AWS networking, EC2 deployment, S3 storage, environment workspaces, remote state migration, state locking, validation and cost-aware infrastructure management.

## 9. Evidence to attach

For a complete assessment package, attach screenshots of:
- Successful `terraform validate`
- `terraform workspace list`
- QA `terraform state list`
- AWS VPC and EC2 resources
- S3 remote-state bucket and workspace state objects

Hide account identifiers, public IP addresses and other sensitive details in screenshots before submission.
