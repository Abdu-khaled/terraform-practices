# Terraform Task 6 – Solution

## 📌 Overview
This repository contains my solution to Task 6.  

## 1️⃣ Create Arch1
### Requirement
> Create Arch1 using Terraform and ensure all variables are managed using a `*.tfvars` file.

### Solution
- Defined variables in `variables.tf`.
- Values are stored in `terraform.tfvars` (not committed, but `terraform.tfvars.example` is provided).
- Arch1 provisions:
  - VPC
  - Public + Private subnets
  - Internet Gateway + NAT Gateway
  - Route tables
  - Security group
  - One EC2 instance (Ubuntu + Apache).