/*
 * Virtual Private Cloud
 */

resource "aws_vpc" "my-vpc" {
  cidr_block= var.cidr
  enable_dns_hostnames = "true"
  tags={
      Name= var.vpc_name 
 }
}

/*
 * Public-Subnets
 */
 resource "aws_subnet" "public-subnet" {
  vpc_id= aws_vpc.my-vpc.id
  cidr_block= var.public_cidr
  map_public_ip_on_launch= "true"

  tags={
      Name= var.public_subnet
  }
}

/*
 * Private-Subnets
 */
resource "aws_subnet" "private-subnet" {
    vpc_id= aws_vpc.my-vpc.id
    cidr_block= var.private_cidr

    tags={
       Name= var.private_subnet
    }

}




