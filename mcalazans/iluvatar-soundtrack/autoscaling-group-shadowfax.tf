###
### Autoscaling Groups
###
resource "aws_autoscaling_group" "worker_shadowfax_asg" {
  launch_configuration = "${aws_launch_configuration.worker_shadowfax_lc.id}"
  vpc_zone_identifier = [
    "${aws_subnet.private_subnet_0.id}",
    "${aws_subnet.private_subnet_1.id}",
    "${aws_subnet.private_subnet_2.id}"
  ]
  load_balancers = ["${aws_elb.worker_shadowfax_elb.name}"]
  health_check_type = "ELB"
  desired_capacity = "${var.min_workers}"
  min_size = "${var.min_workers}"
  max_size = "${var.max_workers}"
  tag {
    key = "Name"
    value = "${var.vpc_name}:shadowfax"
    propagate_at_launch = true
  }
  depends_on = [
    "aws_subnet.public_subnet_0",
    "aws_subnet.public_subnet_1",
    "aws_subnet.public_subnet_2"
  ]
}