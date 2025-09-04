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