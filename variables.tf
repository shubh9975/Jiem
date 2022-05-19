variable "profile" {
  default= "test"

}

variable "cidr" {
  default= "10.0.0.0/16"
  
}

variable "vpc_name" {
  default= "demovpc"
 
}
variable "public_cidr" {
    default= "10.0.1.0/24" 
}
variable "public_subnet" {
  default= "Public_subnet"
  
}

variable "private_cidr" {
  default= "10.0.2.0/24"
  
}
variable "private_subnet" {
  default= "private_subnet"
  
}

variable "igw_name" {
  default= "test_igw"

}

variable "Public_Table" {
  default= "public_route_table"

}

variable "nat_gateway" {
  default= "nat-gateway"

}

variable "eip" {
  default= "elastic-ip"

}

variable "HostSecurityGroup" {
  default= "mysecurity"

}

variable "instance_name" {
  default= "public_instance"

}

