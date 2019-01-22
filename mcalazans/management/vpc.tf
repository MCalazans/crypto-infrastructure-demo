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

###
### Launch Configurations
###
resource "aws_launch_configuration" "worker_lc" {
  image_id = "${var.worker_AMI}"
  instance_type = "${var.worker_type}"
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello world" > index.html
              nohup busybox httpd -f -p "${var.worker_ec2_instance_port}" &
              EOF
  security_groups = [
    "${aws_security_group.worker_ec2_sg.id}"
  ]
  lifecycle {
    create_before_destroy = true
  }
}

###
### Autoscaling Groups
###
resource "aws_autoscaling_group" "worker_asg" {
  launch_configuration = "${aws_launch_configuration.worker_lc.id}"
  availability_zones = [
    "${data.aws_availability_zones.all.names}"
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

###
### Load Balancers
###
resource "aws_elb" "worker_elb" {
  name = "mentoria-worker-elb"
  availability_zones = [
    "${data.aws_availability_zones.all.names}"
  ]
  security_groups = [
    "${aws_security_group.worker_elb_sg.id}"
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
