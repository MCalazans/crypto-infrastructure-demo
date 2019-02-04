###
### Security Groups
###
resource "aws_security_group" "worker_ec2_sg" {
  ingress {
    from_port = "${var.worker_ec2_instance_port}"
    to_port = "${var.worker_ec2_instance_port}"
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

resource "aws_security_group" "worker_elb_sg" {
  ingress {
    from_port = "${var.worker_elb_port}"
    to_port = "${var.worker_elb_port}"
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}