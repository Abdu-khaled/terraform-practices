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

---

## 2. Research Terraform modules and explore how they can be used for better reusability and maintainability.
*A Terraform module is a collection of standard configuration files in a dedicated directory. Terraform modules encapsulate groups of resources dedicated to one task, reducing the amount of code you have to develop for similar infrastructure components.*

*Some say that Terraform modules are a way of extending your present Terraform configuration with existing parts of reusable code reducing the amount of code you have to develop for similar infrastructure components. Others say that the Terraform module definition is a single or many .tf files stacked together in their own directory. Both are correct.*

*Module blocks can also be used to force compliance on other resources—to deploy databases with encrypted disks, for example. By hard-coding the encryption configuration and not exposing it through variables, you’re making sure that every time the module is used, the disks are going to be encrypted.*


**Why modules?**

- Encapsulate a set of resources (VPC, EC2, autoscaling group, database) into reusable building blocks.

- Promote DRY, enforce consistent patterns and outputs/inputs.

- Allow versioning and sharing (Terraform Registry or private module repo).


**Best practices**

- Keep modules small and single-responsibility.

- Use clear input variables and outputs.

- Use README.md in module to document required vars, outputs, and examples.

- Version modules and pin source with a tag (if using remote registry or git).

- Use terraform fmt, validate, and unit tests where possible.

---

