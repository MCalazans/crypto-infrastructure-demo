###
### Route table
###
### Public route table
resource "aws_route_table" "public-route-table" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  tags {
    Name = "${var.vpc_name}:public-route"
  }
}
resource "aws_route" "public-route" {
  route_table_id = "${aws_route_table.public-route-table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.internet-gateway.id}"
  depends_on = [
    "aws_route_table.public-route-table"
  ]
}
### Private route table
resource "aws_route_table" "private-route-table" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  tags {
    Name = "${var.vpc_name}:private-route"
  }
}
resource "aws_route" "private-route" {
  route_table_id = "${aws_route_table.private-route-table.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.nat-gateway.id}"
  depends_on = [
    "aws_route_table.private-route-table"
  ]
}