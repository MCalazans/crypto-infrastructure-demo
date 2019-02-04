###
### Load Balancers
###
resource "aws_elb" "worker_elb" {
  name = "mentoria-worker-elb"
  availability_zones = [
    "${data.aws_availability_zones.all.names[0]}",
    "${data.aws_availability_zones.all.names[1]}",
    "${data.aws_availability_zones.all.names[2]}"
  ]
  security_groups = [
    "${aws_security_group.worker_elb_sg.id}"
  ]
  subnets = [
    "${aws_subnet.public_subnet_0.id}",
    "${aws_subnet.public_subnet_1.id}",
    "${aws_subnet.public_subnet_2.id}"
  ]
  listener {
    lb_port = "${var.worker_elb_port}"
    lb_protocol = "${var.worker_elb_protocol}"
    instance_port = "${var.worker_ec2_instance_port}"
    instance_protocol = "${var.worker_ec2_instance_protocol}"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:${var.worker_ec2_instance_port}/"
  }  
}
