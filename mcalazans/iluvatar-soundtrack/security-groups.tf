###
### Security Groups
###
resource "aws_security_group" "worker_elb" {
  name = "${var.vpc_name}:worker-elb-sg"
  description = "Allow traffic to elb worker"
  vpc_id = "${aws_vpc.main_vpc.id}"
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
resource "aws_security_group" "worker_ec2" {
  name = "${var.vpc_name}:worker-ec2-sg"
  description = "Allow traffic to ec2 instances worker"
  vpc_id = "${aws_vpc.main_vpc.id}"
  ingress {
    from_port = "${var.worker_ec2_instance_port}"
    to_port = "${var.worker_ec2_instance_port}"
    protocol = "tcp"
    security_groups = [
      "${aws_security_group.worker_elb.id}"
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