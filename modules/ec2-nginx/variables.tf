variable "subnet_id" {
  type        = string
  description = "Subnet ID to launch the EC2 instance into"
}

variable "sg_ids" {
  type        = list(string)
  description = "List of security group IDs to attach"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "AWS key pair name for SSH access"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the instance (Amazon Linux 2 recommended)"
}

variable "name" {
  type        = string
  description = "Name tag for the EC2 instance"
}
