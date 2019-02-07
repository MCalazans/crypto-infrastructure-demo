# Worker - Instance EC2 specs
variable "worker_AMI" {
	description = "The AMI that will be used as base for workers instances"
	default = "ami-090bf04b47871851c"
}

variable "worker_type" {
	description = "The Instance Type that will be used to launch workers, by default"
	default = "t2.nano"
}

variable "worker_key_name" {
	description = "The key that will be used to access the instances by SSH"
	default = "key-of-barad-dur"
}

# EC2 Worker - Service specs
variable "worker_ec2_instance_port" {
  description = "The port that the server will use for HTTP request"
  default = 8080
}

variable "worker_ec2_instance_protocol" {
  description = "The protocol that this server will work with"
  default = "http"
}

# ELB Worker - Listener specs
variable "worker_elb_port" {
	description = "The port that the ELB will listen to forward to workers server" 
	default = 80
}

variable "worker_elb_protocol" {
	description = "The protocol that the ELB will work with" 
	default = "http"
}

# ASG Worker specs
variable "max_workers" {
	description = "The maximum number of worker instances" 
	default = "4"
}

variable "min_workers" {
	description = "The minimum number of worker instances" 
	default = "2"
}