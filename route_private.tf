resource "aws_route_table" "route-tb-private" {
  vpc_id= aws_vpc.my-vpc.id

  route{
      cidr_block= "0.0.0.0/0"
      nat_gateway_id=aws_nat_gateway.nat-gw.id
  }
  tags={
      Name= "Private-Table"
      
  }
}
resource "aws_route_table_association" "private-subnet-association" {
    subnet_id= aws_subnet.private-subnet.id
    route_table_id= aws_route_table.route-tb-private.id
  
}
