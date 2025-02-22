#creating vpc
resource "aws_vpc" "prod" {
 cidr_block = "10.0.0.0/16"
 tags = {
   Name = "prod_vpc"
 }

}
#creating subnet
resource "aws_subnet" "prvn-sb" {
    vpc_id = aws_vpc.prod.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "prod_subnet"
    }
  
}
resource "aws_subnet" "prvn-sb_private" {
    vpc_id = aws_vpc.prod.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "private-subnet"
    }
  
}

#create internet gateway
resource "aws_internet_gateway" "prvn-ig" {
    vpc_id = aws_vpc.prod.id
    tags = {
      Name = "ig"
    }
  
}
#create route table and edit routes
resource "aws_route_table" "pub-route" {
    vpc_id = aws_vpc.prod.id
    tags = {
      Name= "publicroute"
    }
    route {
        gateway_id = aws_internet_gateway.prvn-ig.id
        cidr_block = "0.0.0.0/0"
    }
  
}

#subnet association
resource "aws_route_table_association" "pub" {
   route_table_id = aws_route_table.pub-route.id
    subnet_id = aws_subnet.prvn-sb.id
}

#create elastic ip 
  resource "aws_eip" "prvn-eip" {
    domain = "vpc"
  }

#create natgateway for private subnet
resource "aws_nat_gateway" "prvn-nat" {
  allocation_id = aws_eip.prvn-eip.id
  subnet_id = aws_subnet.prvn-sb.id
    tags = {
      Name = "prvn-nat"  
}
}
#create route for private subnets and edit routes
resource "aws_route_table" "custroute" {
    vpc_id = aws_vpc.prod.id
    tags = {
      Name = "custroutetable"
    }

    route {
        nat_gateway_id = aws_nat_gateway.prvn-nat.id
        cidr_block = "0.0.0.0/0"
    }
  
}
#route table association
resource "aws_route_table_association" "prvn-sb_private-association" {
   route_table_id = aws_route_table.custroute.id
    subnet_id = aws_subnet.prvn-sb_private.id
}
#create security group
resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    description = "Allow TLS inbound traffic"
    vpc_id = aws_vpc.prod.id

    ingress {
        description = "TLS from ssh"
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  ingress {
    description = "TLS from ssh"
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}