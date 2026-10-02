# AWS EC2 & S3 Automation with Bash

## Overview

This project demonstrates AWS infrastructure automation using **Bash and the AWS CLI**.

The scripts automate the creation of:

* Amazon EC2 instances
* Amazon S3 buckets

This project was completed as part of my hands-on **DevOps & Cloud Engineering training with Mise Academy**.

## Technologies

* Linux
* Bash
* AWS CLI
* Amazon EC2
* Amazon S3

## Project Structure

```text
aws-ec2-s3-automation/
├── create_ec2.sh
├── S3bucket_creation.sh
└── README.md
```

## EC2 Automation

`create_ec2.sh` automates the launch of an EC2 instance using the AWS CLI.

The script:

* Launches an EC2 instance
* Uses a specified AMI
* Configures the instance type
* Uses an SSH key pair
* Uses a security group
* Adds a Name tag
* Displays the created instance ID
* Handles launch failures

## S3 Automation

`S3bucket_creation.sh` automates S3 bucket creation.

The script:

* Creates an S3 bucket
* Generates a unique bucket name
* Configures the AWS region
* Displays success or failure messages

## Prerequisites

Before running the scripts, you need:

* Linux, WSL, or another Bash environment
* AWS CLI
* Configured AWS credentials
* Appropriate IAM permissions for EC2 and S3

Configure AWS credentials:

```bash
aws configure
```

Make the scripts executable:

```bash
chmod +x create_ec2.sh
chmod +x S3bucket_creation.sh
```

Run the scripts:

```bash
./S3bucket_creation.sh
./create_ec2.sh
```

## What I Learned

* Automating AWS infrastructure using Bash
* Using the AWS CLI
* Working with EC2 and S3 from the command line
* Using variables in Bash scripts
* Handling command failures
* Automating repetitive cloud infrastructure tasks

## Important Note

The original training environment used specific AWS resource values such as an AMI ID, security group ID, key-pair name, and AWS region.

Before running these scripts in another AWS account, update those values to match your own environment.
