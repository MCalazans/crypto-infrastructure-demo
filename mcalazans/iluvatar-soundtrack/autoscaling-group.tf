###
### Autoscaling Groups
###
resource "aws_autoscaling_group" "worker_asg" {
  launch_configuration = "${aws_launch_configuration.worker_lc.id}"
  availability_zones = [
    "${data.aws_availability_zones.all.names[0]}",
    "${data.aws_availability_zones.all.names[1]}",
    "${data.aws_availability_zones.all.names[2]}"
  ]
  vpc_zone_identifier = [
    "${aws_subnet.private_subnet_0.id}",
    "${aws_subnet.private_subnet_1.id}",
    "${aws_subnet.private_subnet_2.id}"
  ]
  load_balancers = ["${aws_elb.worker_elb.name}"]
  health_check_type = "ELB"
  min_size = 2
  max_size = 4
  tag {
    key = "Name"
    value = "mentoria-worker-asg"
    propagate_at_launch = true
  }
}