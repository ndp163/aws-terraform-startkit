resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.cluster_vpc.id
  cidr_block              = var.public_subnet_1
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name = "${terraform.workspace}-${var.project}-public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id                  = aws_vpc.cluster_vpc.id
  cidr_block              = var.public_subnet_2
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}c"

  tags = {
    Name = "${terraform.workspace}-${var.project}-public-subnet-2"
  }
}

resource "aws_route_table_association" "public_subnet_1a_association" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_vpc.cluster_vpc.main_route_table_id
}

resource "aws_route_table_association" "public_subnet_dev_1c_assoion" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_vpc.cluster_vpc.main_route_table_id
}
