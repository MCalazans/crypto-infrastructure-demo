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