provider "aws" {
  region = "${var.region}"
}

data "aws_availability_zones" "all" {}

output "arod" {
  value = "${aws_elb.worker_arod_elb.dns_name}"
}

output "shadowfax" {
  value = "${aws_elb.worker_shadowfax_elb.dns_name}"
}