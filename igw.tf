resource "aws_internet_gateway" "internet-gateway" {
    vpc_id= aws_vpc.my-vpc.id
    
    tags = {
        Name= var.igw_name
    }
}
