###
### NAT Gateway
###
resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = "${aws_eip.elastic-ip.id}"
  subnet_id = "${aws_subnet.public_subnet_0.id}"
}
###
### Internet Gateway
###
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = "${aws_vpc.main_vpc.id}"
}