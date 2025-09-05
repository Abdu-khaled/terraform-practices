# Terraform Task 6 – Solution

## 📌 Overview
This repository contains my solution to Task 6.  


## 1️Create Arch1
### Requirement
> Create Arch1 using Terraform and ensure all variables are managed using a `*.tfvars` file.

### Solution

- **`provider.tf`**

  ```bash
  terraform {
    required_version = ">= 1.5.0"
    required_providers {
        aws = { source = "hashicorp/aws", version = "~> 5.0" }
     }
  }

  provider "aws" {
    region = var.aws_region
  }
  ```

- **Defined variables in `variables.tf`.**
  ```bash
    variable "aws_region" {   
    type        = string
    description = "AWS region to deploy resources"
    }

    variable "vpc_cidr" {
    description = "CIDR block for VPC"
    type        = string
    #   default     = "10.0.0.0/16"
    }

    variable "public_subnet_cidr" {
    type        = string
    }

    variable "private_subnet_cidr" {
    type        = string
    }

    variable "instance_type"  {
    type = string 
    }

    variable "key_name" {
    type = string 
    }
  ```
  
- **`main.tf` ( VPC, IGW, public+private subnets, NAT GW, routes, one EC2) code in my github repo.**
   - **Arch1 provisions:**
      - VPC
      - Public + Private subnets
      - Internet Gateway + NAT Gateway
      - Route tables
      - Security group
      - One EC2 instance (Ubuntu + Apache).


- **Values are stored in `terraform.tfvars`**

**Run:**
```bash
cd arch1
terraform init
terraform apply -var-file="terraform.tfvars" -auto-approve
```

### Verification Command

#### 1. terraform init
![](./screenshot/01.png)

#### 2. `terraform apply -var-file="terraform.tfvars" -auto-approve`
![](./screenshot/02.png)

### Verification in AWS

**1. Network (VPC, Public + Private subnets, Internet Gateway + NAT Gateway )**
![](./screenshot/03.png)

**Public + Private subnets**
![](./screenshot/04.png)

**Route tables**
![](./screenshot/05.png)

**Internet Gateway**
![](./screenshot/06.png)

**NAT Gateway**
![](./screenshot/07.png)

**Security Group**
![](./screenshot/08.png)

**EC2 instance (Ubuntu + Apache)**

![](./screenshot/09.png)
![](./screenshot/10.png)

