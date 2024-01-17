output "config" {
  value = {
    id               = aws_vpc.cluster_vpc.id
    route_table_id   = aws_vpc.cluster_vpc.main_route_table_id
    public_subnet_1a = aws_subnet.public_subnet_1a.id
    public_subnet_1c = aws_subnet.public_subnet_1c.id
  }
}
