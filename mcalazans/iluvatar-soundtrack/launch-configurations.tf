###
### Launch Configurations
###
resource "aws_launch_configuration" "worker_lc" {
  name = "${var.vpc_name}-worker"
  image_id = "${var.worker_AMI}"
  instance_type = "${var.worker_type}"
  user_data = <<-EOF
              #!/bin/bash
              start-service --service shadowfax
              EOF
  security_groups = [
    "${aws_security_group.worker_ec2.id}"
  ]
  lifecycle {
    create_before_destroy = true
  }
}