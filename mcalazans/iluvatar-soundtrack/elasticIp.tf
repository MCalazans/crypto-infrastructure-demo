###
### EC2 - Elastic IP
###
resource "aws_eip" "elastic-ip" {
  vpc = true
  tags {
    Name = "${var.vpc_name}:elastic-ip"
  }
}