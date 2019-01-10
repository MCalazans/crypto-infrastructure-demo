resource "aws_instance" "worker" {
  ami           = "${var.worker_AMI}"
  instance_type = "${var.worker_type}"
}