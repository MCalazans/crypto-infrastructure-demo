###
### Security Groups
###
resource "aws_security_group" "worker_elb" {
  name = "${var.vpc_name}:worker-elb-sg"
  description = "Allow traffic to elb worker"
  vpc_id = "${aws_vpc.main_vpc.id}"
  ingress {
    from_port = "${var.arda_port}"
    to_port = "${var.arda_port}"
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

#Arod Security group
resource "aws_security_group" "arod_sg" {
  name = "${var.vpc_name}:arod_sg"
  description = "Allow traffic to arod worker instances"
  vpc_id = "${aws_vpc.main_vpc.id}"
  ingress {
    from_port = "${var.arod_port}"
    to_port = "${var.arod_port}"
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

#Shadowfax Security group
resource "aws_security_group" "shadowfax_sg" {
  name = "${var.vpc_name}:shadowfax_sg"
  description = "Allow traffic to shadowfax worker instances"
  vpc_id = "${aws_vpc.main_vpc.id}"
  ingress {
    from_port = "${var.shadowfax_port}"
    to_port = "${var.shadowfax_port}"
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