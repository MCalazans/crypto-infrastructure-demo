###
### Subnets
###
### Private
resource "aws_subnet" "private_subnet_0" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  cidr_block = "${var.private_subnet_0_cidr}"
  availability_zone = "${data.aws_availability_zones.all.names[0]}"
  depends_on = [
    "aws_vpc.main_vpc",
    "aws_route_table.private-route-table"
  ]
  tags {
    Name = "${var.vpc_name}:private-${element(split("-","${data.aws_availability_zones.all.names[0]}"),2)}"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  cidr_block = "${var.private_subnet_1_cidr}"
  availability_zone = "${data.aws_availability_zones.all.names[1]}"
  depends_on = [
    "aws_vpc.main_vpc",
    "aws_route_table.private-route-table"
  ]
  tags {
    Name = "${var.vpc_name}:private-${element(split("-","${data.aws_availability_zones.all.names[1]}"),2)}"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  cidr_block = "${var.private_subnet_2_cidr}"
  availability_zone = "${data.aws_availability_zones.all.names[2]}"
  depends_on = [
    "aws_vpc.main_vpc",
    "aws_route_table.private-route-table"
  ]
  tags {
    Name = "${var.vpc_name}:private-${element(split("-","${data.aws_availability_zones.all.names[2]}"),2)}"
  }
}
### Public
resource "aws_subnet" "public_subnet_0" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  cidr_block = "${var.public_subnet_0_cidr}"
  availability_zone = "${data.aws_availability_zones.all.names[0]}"
  depends_on = [
    "aws_vpc.main_vpc",
    "aws_route_table.public-route-table"
  ]
  tags {
    Name = "${var.vpc_name}:public-${element(split("-","${data.aws_availability_zones.all.names[0]}"),2)}"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  cidr_block = "${var.public_subnet_1_cidr}"
  availability_zone = "${data.aws_availability_zones.all.names[1]}"
  depends_on = [
    "aws_vpc.main_vpc",
    "aws_route_table.public-route-table"
  ]
  tags {
    Name = "${var.vpc_name}:public-${element(split("-","${data.aws_availability_zones.all.names[1]}"),2)}"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = "${aws_vpc.main_vpc.id}"
  cidr_block = "${var.public_subnet_2_cidr}"
  availability_zone = "${data.aws_availability_zones.all.names[2]}"
  depends_on = [
    "aws_vpc.main_vpc",
    "aws_route_table.public-route-table"
  ]
  tags {
    Name = "${var.vpc_name}:public-${element(split("-","${data.aws_availability_zones.all.names[2]}"),2)}"
  }
}