# Uncomment this file if you want to create the private-subnet, it will cost you on the nat gateway
# Just used if really needed

# resource "aws_subnet" "private_subnet_1a" {
#   vpc_id            = aws_vpc.cluster_vpc.id
#   cidr_block        = var.private_subnet_1
#   availability_zone = "${var.aws_region}a"

#   tags = {
#     Name = "${terraform.workspace}-${var.project}-private-subnet-1"
#   }
# }

# resource "aws_subnet" "private_subnet_1c" {
#   vpc_id                  = aws_vpc.cluster_vpc.id
#   cidr_block              = var.private_subnet_2
#   availability_zone       = "${var.aws_region}c"

#   tags = {
#     Name = "${terraform.workspace}-${var.project}-private-subnet-2"
#   }
# }

# # Creating an Elastic IP for the NAT Gateway!
# resource "aws_eip" "eip_1" {
#   depends_on = [
#     aws_vpc.cluster_vpc
#   ]
#   vpc = true
# }

# resource "aws_eip" "eip_2" {
#   depends_on = [
#     aws_vpc.cluster_vpc
#   ]
#   vpc = true
# }

# # Creating a NAT Gateway!
# resource "aws_nat_gateway" "nat_gateway_1" {
#   depends_on = [
#     aws_eip.eip_1
#   ]

#   # Allocating the Elastic IP to the NAT Gateway!
#   allocation_id = aws_eip.eip_1.id

#   # Associating it in the Public Subnet!
#   subnet_id = aws_subnet.public_subnet_1a.id

#   tags = {
#     Name = "${terraform.workspace}-${var.project}-nat-gateway-1"
#   }
# }

# resource "aws_nat_gateway" "nat_gateway_2" {
#   depends_on = [
#     aws_eip.eip_2
#   ]

#   # Allocating the Elastic IP to the NAT Gateway!
#   allocation_id = aws_eip.eip_2.id

#   # Associating it in the Public Subnet!
#   subnet_id = aws_subnet.public_subnet_1c.id

#   tags = {
#     Name = "${terraform.workspace}-${var.project}-nat-gateway-2"
#   }
# }

# # Creating a Route Table for the Nat Gateway!
# resource "aws_route_table" "private_subnet_1" {
#   depends_on = [
#     aws_nat_gateway.nat_gateway_1
#   ]

#   vpc_id = aws_vpc.cluster_vpc.id
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gateway_1.id
#   }

#   tags = {
#     Name = "${terraform.workspace}-${var.project}-private-subnet-1"
#   }
# }

# resource "aws_route_table" "private_subnet_2" {
#   depends_on = [
#     aws_nat_gateway.nat_gateway_2
#   ]

#   vpc_id = aws_vpc.cluster_vpc.id
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gateway_2.id
#   }
# }

# # Creating an Route Table Association of the NAT Gateway route
# # table with the Private Subnet!
# resource "aws_route_table_association" "nat_gateway_1" {
#   depends_on = [
#     aws_route_table.private_subnet_1
#   ]

#   subnet_id      = aws_subnet.private_subnet_1a.id
#   route_table_id = aws_route_table.private_subnet_1.id
# }

# resource "aws_route_table_association" "nat_gateway_2" {
#   depends_on = [
#     aws_route_table.private_subnet_2
#   ]

#   subnet_id      = aws_subnet.private_subnet_1c.id
#   route_table_id = aws_route_table.private_subnet_2.id
# }
