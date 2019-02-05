###
### Route table assoc
###
### Private Route Table and Private Subent 0
resource "aws_route_table_association" "private-route-table-assoc-subnet-0" {
  subnet_id = "${aws_subnet.private_subnet_0.id}"
  route_table_id = "${aws_route_table.private-route-table.id}"
}
### Private Route Table and Private Subent 1
resource "aws_route_table_association" "private-route-table-assoc-subnet-1" {
  subnet_id = "${aws_subnet.private_subnet_1.id}"
  route_table_id = "${aws_route_table.private-route-table.id}"
}
### Private Route Table and Private Subent 2
resource "aws_route_table_association" "private-route-table-assoc-subnet-2" {
  subnet_id = "${aws_subnet.private_subnet_2.id}"
  route_table_id = "${aws_route_table.private-route-table.id}"
}

### Public Route Table and Public Subent 0
resource "aws_route_table_association" "public-route-table-assoc-subnet-0" {
  subnet_id = "${aws_subnet.public_subnet_0.id}"
  route_table_id = "${aws_route_table.public-route-table.id}"
}
### Public Route Table and Public Subent 1
resource "aws_route_table_association" "public-route-table-assoc-subnet-1" {
  subnet_id = "${aws_subnet.public_subnet_1.id}"
  route_table_id = "${aws_route_table.public-route-table.id}"
}
### Public Route Table and Public Subent 2
resource "aws_route_table_association" "public-route-table-assoc-subnet-2" {
  subnet_id = "${aws_subnet.public_subnet_2.id}"
  route_table_id = "${aws_route_table.public-route-table.id}"
}