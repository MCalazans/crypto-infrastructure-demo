provider "aws" {
  region = "${var.region}"
}

data "aws_availability_zones" "all" {}

output "worker_elb_dsn_name" {
  value = "${aws_elb.worker_elb.dns_name}"
}