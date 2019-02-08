# Worker - Instance EC2 specs
variable "bastion_AMI" {
	description = "The AMI that will be used as base for bastions instances"
	default = "ami-0fd836fce3d8d9e4c"
}

variable "bastion_type" {
	description = "The Instance Type that will be used to launch bastions, by default"
	default = "t2.nano"
}

variable "bastion_key_name" {
	description = "The key that will be used to access the instances by SSH"
	default = "key-of-barad-dur"
}

variable "bastion_port" {
  description = "The port that arod are listening"
  default = 22
}

variable "bastion_address_allowed" {
  description = "The port address that can access the port 22"
  default = "0.0.0.0/0"
}

# ASG Bastion specs
variable "max_bastions" {
	description = "The maximum number of bastion instances" 
	default = "2"
}

variable "min_bastions" {
	description = "The minimum number of bastion instances" 
	default = "1"
}