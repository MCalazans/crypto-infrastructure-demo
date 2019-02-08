# Worker - Instance EC2 specs
variable "bastion_AMI" {
	description = "The AMI that will be used as base for bastions instances"
	default = "ami-05657f14bae0acdd1"
}

variable "bastion_type" {
	description = "The Instance Type that will be used to launch bastions, by default"
	default = "t2.nano"
}

variable "bastion_key_name" {
	description = "The key that will be used to access the instances by SSH"
	default = "key-of-barad-dur"
}
