###
### Application Load Balancer
###
resource "aws_lb" "arda-loadbalancer" {
  name = "${var.lb-name}"
  internal = false
  load_balancer_type = "application"
  security_groups = [
    "${aws_security_group.worker_elb.id}"
  ]
  subnets = [
    "${aws_subnet.public_subnet_0.id}",
    "${aws_subnet.public_subnet_1.id}",
    "${aws_subnet.public_subnet_2.id}"
  ]
  enable_deletion_protection = false
  tags {
    Name = "${var.lb-name}"
  }
  depends_on = [
    "aws_subnet.public_subnet_0",
    "aws_subnet.public_subnet_1",
    "aws_subnet.public_subnet_2"
  ]
}