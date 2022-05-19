resource "aws_route_table" "route-tb" {
  vpc_id= aws_vpc.my-vpc.id

  route{
      cidr_block= "0.0.0.0/0"
      gateway_id= aws_internet_gateway.internet-gateway.id
  }
  tags={
      Name= var.Public_Table
  }
}

/*
 * Route-Table association
 */
resource "aws_route_table_association" "Nat-subnet-association" {
      subnet_id= aws_subnet.public-subnet.id
      route_table_id= aws_route_table.route-tb.id
}



