# Default environments specs
variable "project_name" {
  description = "The name of this project"
  default = "middle-earth"
}

variable "vpc_name" {
  description = "The name of the vpc"
  default = "middle-earth-vpc"
}

variable "region" {
  description = "The default region that the project will run"
  default  = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR that will be performed by the VPC"
  default  = "10.0.0.0/16"
}
# Public subnets
variable "public_subnet_0_cidr" {
  description = "The CIDR that will be performed by the subnets in the above VPC"
  default  = "10.0.1.0/24"
}

variable "public_subnet_1_cidr" {
  description = "The CIDR that will be performed by the subnets in the above VPC"
  default  = "10.0.2.0/24"
}

variable "public_subnet_2_cidr" {
  description = "The CIDR that will be performed by the subnets in the above VPC"
  default  = "10.0.3.0/24"
}
### Private subnets
variable "private_subnet_0_cidr" {
  description = "The CIDR that will be performed by the subnets in the above VPC"
  default  = "10.0.10.0/24"
}

variable "private_subnet_1_cidr" {
  description = "The CIDR that will be performed by the subnets in the above VPC"
  default  = "10.0.11.0/24"
}

variable "private_subnet_2_cidr" {
  description = "The CIDR that will be performed by the subnets in the above VPC"
  default  = "10.0.12.0/24"
}