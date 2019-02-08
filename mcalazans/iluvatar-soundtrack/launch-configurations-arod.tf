###
### Launch Configurations
###
resource "aws_launch_configuration" "worker_arod_lc" {
  name = "${var.vpc_name}-worker-arod"
  image_id = "${var.worker_AMI}"
  instance_type = "${var.worker_type}"
  key_name = "${var.worker_key_name}"
  user_data_base64 = "${base64encode(data.template_file.user_arod_data.rendered)}"
  security_groups = [
    "${aws_security_group.arod_sg.id}"
  ]
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    "aws_key_pair.key_of_barad_dur"
  ]
}

data "template_file" "user_arod_data" {
  template = <<EOF
#!/bin/bash
/var/mcalazans/dojo/bin/start-service --service arod
EOF
}
