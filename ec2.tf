resource "aws_security_group" "security" {
    name= "MySecurity-Group"
    vpc_id= aws_vpc.my-vpc.id

    egress{
        from_port= 0
        to_port= 0
        protocol= "-1"
        cidr_blocks= ["0.0.0.0/0"]

    }
    ingress{
        from_port= 22
        to_port= 22
        protocol= "tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }

    tags={
        Name= var.HostSecurityGroup
    } 
}

resource "aws_instance" "public" {
    ami= "ami-05ba3a39a75be1ec4"
    instance_type= "t2.micro"
    subnet_id= aws_subnet.public-subnet.id
    vpc_security_group_ids= [aws_security_group.security.id]  
    key_name= "my-key1"
    user_data= <<-EOF
                 #!/bin/bash
                 sudo apt-get update -y
                 sudo apt install docker -y
                 sudo apt install git jq -y
                 sudo service docker start
                 sudo pip install ansible
                 sudo cp /usr/local/bin/ansible /usr/bin/ansible
                 sudo apt-get update -y
                 sudo apt-get install openjdk-8-jdk
                 wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
                 sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
                 sudo apt-get update
                 sudo apt-get install jenkins
                 sudo apt install git
                 EOF

 
    tags={
        Name= var.instance_name
    } 

}



resource "aws_instance" "private" {
    ami= "ami-05ba3a39a75be1ec4"
    instance_type= "t2.micro"
    subnet_id= aws_subnet.private-subnet.id
    vpc_security_group_ids= [aws_security_group.security.id]
    key_name= "my-key1"
}
