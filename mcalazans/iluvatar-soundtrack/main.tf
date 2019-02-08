provider "aws" {
  region = "${var.region}"
}

data "aws_availability_zones" "all" {}

output "arda" {
  value = "${aws_lb.arda-loadbalancer.dns_name}"
}