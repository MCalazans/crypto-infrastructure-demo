###
### Security Groups
###
resource "aws_security_group" "worker-elb" {
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
  tags {
    Name = "${var.vpc_name}:worker-elb-sg"
  }
}

#Arod Security group
resource "aws_security_group" "arod-sg" {
  name = "${var.vpc_name}:arod-sg"
  description = "Allow traffic to arod worker instances"
  vpc_id = "${aws_vpc.main_vpc.id}"
  ingress {
    from_port = "${var.arod_port}"
    to_port = "${var.arod_port}"
    protocol = "tcp"
    security_groups = [
      "${aws_security_group.worker-elb.id}"
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
  tags {
    Name = "${var.vpc_name}:arod-sg"
  }
}

#Shadowfax Security group
resource "aws_security_group" "shadowfax-sg" {
  name = "${var.vpc_name}:shadowfax-sg"
  description = "Allow traffic to shadowfax worker instances"
  vpc_id = "${aws_vpc.main_vpc.id}"
  ingress {
    from_port = "${var.shadowfax_port}"
    to_port = "${var.shadowfax_port}"
    protocol = "tcp"
    security_groups = [
      "${aws_security_group.worker-elb.id}"
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
  tags {
    Name = "${var.vpc_name}:shadowfax-sg"
  }
}

#Bastion Security group
resource "aws_security_group" "bastion-sg" {
  name = "${var.vpc_name}:bastion-sg"
  description = "Allow traffic to bastion instances"
  vpc_id = "${aws_vpc.main_vpc.id}"
  ingress {
    from_port = "${var.bastion_port}"
    to_port = "${var.bastion_port}"
    protocol = "tcp"
    cidr_blocks = [
      "${var.bastion_address_allowed}"
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
  tags {
    Name = "${var.vpc_name}:bastion-sg"
  }
}

#Bastion client security group - Allow the instance receive ssh conections
resource "aws_security_group" "bastion-client-sg" {
  name = "${var.vpc_name}:bastion-client-sg"
  description = "Allow traffic from bastion instances to worker instances"
  vpc_id = "${aws_vpc.main_vpc.id}"
  ingress {
    from_port = "${var.bastion_port}"
    to_port = "${var.bastion_port}"
    protocol = "tcp"
    security_groups = [
      "${aws_security_group.bastion-sg.id}"
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
  tags {
    Name = "${var.vpc_name}:bastion-client-sg"
  }
}