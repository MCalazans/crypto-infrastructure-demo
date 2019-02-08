###
### Autoscaling Groups
###
resource "aws_autoscaling_group" "bastion_arod_asg" {
  launch_configuration = "${aws_launch_configuration.bastion_lc.id}"
  vpc_zone_identifier = [
    "${aws_subnet.public_subnet_0.id}",
    "${aws_subnet.public_subnet_1.id}",
    "${aws_subnet.public_subnet_2.id}"
  ]
  health_check_type = "ELB"
  desired_capacity = "${var.min_bastions}"
  min_size = "${var.min_bastions}"
  max_size = "${var.max_bastions}"
  tag {
    key = "Name"
    value = "${var.vpc_name}:bastion"
    propagate_at_launch = true
  }
  depends_on = [
    "aws_subnet.public_subnet_0",
    "aws_subnet.public_subnet_1",
    "aws_subnet.public_subnet_2"
  ]
}