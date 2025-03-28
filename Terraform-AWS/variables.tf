# VPC and subnets 
variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "Public_subnets" {
  description = "Public subnets with CIDR blocks and availability zones"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "Private_subnets" {
  description = "Private subnets with CIDR blocks and availability zones"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "project_name" {
  type = string
  description = "The project name"
}

variable "region" {
  description = "region-name"
  type        = string
}

#############################################################################################

# SECURITY GROUPS VARIABLES
variable "common_ingress_rules" {
  description = "Common ingress rules applied to all security groups"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

# Main Security Group
variable "main_sg1_name" {
  description = "The name of the main security group"
  type        = string
}


variable "main_sg1_description" {
  description = "The description of the security group"
  type        = string
}

# extra port addition for main sg incase
variable "main_sg1_extra_ports" {
  description = "Additional ports for Security Group 1"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

# EC2 Security Group 
variable "EC2_sg_name" {
  description = "The name of the second security group"
  type        = string
}

variable "EC2_sg_description" {
  description = "The description of the second security group"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the security group"
  type        = map(string)
  default     = {}
}

variable "EC2_sg_extra_ports" {
  description = "Additional ports for Security Group 2"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

#################################################################################################
# EC2 
# Main server
variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
  description = "EC2 instance type for Main server"
}


variable "key_name" {
  default = "private-key"
  type = string
}

variable "server_name" {
  type = string
  description = "EC2 server name"
}


################################################################################################
# ECR
variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "environment" {
  description = "The environment of the ECR repository"
  type        = string
}