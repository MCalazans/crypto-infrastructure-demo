# Worker - Instance EC2 specs
variable "worker_AMI" {
	description = "The AMI that will be used as base for workers instances"
	default = "ami-009d6802948d06e52"
}

variable "worker_type" {
	description = "The Instance Type that will be used to launch workers, by default"
	default = "t2.nano"
}

# Worker - Service specs
variable "server_port" {
  description = "The port the server will use for HTTP request"
  default = 8080
}