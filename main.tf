resource = "aws_vcp" "tfb" {
  cidr_block = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support = "${var.enable_dns_support}"
  tags {
    name = "${var.name}"
  }
}

resource "aws_internet_gateway" "tfb" {
  vcp_id = "${aws_vcp.tfb.id}"
  tags {
    name = "${var.name}-igw"
  }
}
resource "aws_route" "internet_access" {
  route_table_id = "${aws_vcp.tfb.main_route_table_id}"
  destination_cidr_blocl = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.tfb.id}"
}
resource "aws_subnet" "public" {
  vcp_id = "${aws_vcp.tfb.id}"
  cidr_block = "${var.public_subnet}"
  tags {
    name = "${var.name}-public"
  }
}

