###
### Launch Configurations
###
resource "aws_launch_configuration" "bastion_lc" {
  name = "${var.vpc_name}-bastion"
  image_id = "${var.bastion_AMI}"
  instance_type = "${var.bastion_type}"
  key_name = "${var.bastion_key_name}"
  user_data_base64 = "${base64encode(data.template_file.user_data_bastion.rendered)}"
  security_groups = [
    "${aws_security_group.bastion_sg.id}"
  ]
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    "aws_key_pair.key_of_barad_dur"
  ]
}

data "template_file" "user_data_bastion" {
  template = <<EOF
#!/bin/bash
echo "Só passando pra dizer oi"
EOF
}
