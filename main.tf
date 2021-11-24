 # Main VPC

resource "aws_vpc" "Engineer_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "Engineer_vpc"
  }
}


# Public Subnets 1 and 2

resource "aws_subnet" "Eng_Pub_Subnet1" {
vpc_id = aws_vpc.Engineer_vpc.id
cidr_block = var.Pub1_Cidr
availability_zone = "eu-west-2a"

 tags = {
  name = "Eng_Pub_Subnet"
  }
}


resource "aws_subnet" "Eng_Pub_Subnet2" {
vpc_id = aws_vpc.Engineer_vpc.id
cidr_block = var.pub2_Cidr
availability_zone = "eu-west-2b"

 tags = {
  name = "Eng_Pub_Subnet2"
  }
}


# private subnets 1 and 2

resource "aws_subnet" "Eng_Priv_Subnet1" {
vpc_id = aws_vpc.Engineer_vpc.id
cidr_block = var.priv1_Cidr
availability_zone = "eu-west-2a"

 tags = {
  name = "Eng_Priv_Subnet"
  }
}


resource "aws_subnet" "Eng_Priv_Subnet2" {
vpc_id = aws_vpc.Engineer_vpc.id
cidr_block = var.priv2_Cidr
availability_zone = "eu-west-2b"

 tags = {
  name = "Eng_Priv_Subnet2"
  }
}



# Public route table
resource "aws_route_table" "Eng_Pub_Route_Table" {
  vpc_id = aws_vpc.Engineer_vpc.id
  
  tags = {
    name = "Eng_Pub_Route_Table"
  }
}

# Association with public subnet with public subnets 1 and 2

resource "aws_route_table_association" "Eng_Pub_Assoc_with_RT1" {
  route_table_id = aws_route_table.Eng_Pub_Route_Table.id
  subnet_id      = aws_subnet.Eng_Pub_Subnet1.id
 
}

resource "aws_route_table_association" "Eng_Pub_Assoc_with_RT2" {
  route_table_id = aws_route_table.Eng_Pub_Route_Table.id
  subnet_id      = aws_subnet.Eng_Pub_Subnet2.id
  
}


# Private route table

resource "aws_route_table" "Eng_Priv_Route_Table" {
  vpc_id = aws_vpc.Engineer_vpc.id
  
  tags = {
    name = "Eng_Priv_Route_Table"
  }
}

# Association with public subnet with private subnets 1 and 2

resource "aws_route_table_association" "Eng_Priv_Assoc_with_RT1" {
  route_table_id = aws_route_table.Eng_Priv_Route_Table.id
  subnet_id      = aws_subnet.Eng_Priv_Subnet1.id
  
}

resource "aws_route_table_association" "Eng_Priv_Assoc_with_RT2" {
  route_table_id = aws_route_table.Eng_Priv_Route_Table.id
  subnet_id      = aws_subnet.Eng_Priv_Subnet2.id
  
}

# Internet Gateway
resource "aws_internet_gateway" "Eng_IGW" {
  vpc_id = aws_vpc.Engineer_vpc.id

  tags = {
    name = "Eng_IGW"
  }

}

# Association with IGW 
resource "aws_route" "IGW_Assoc_Pub_Subnet" {
  route_table_id = aws_route_table.Eng_Pub_Route_Table.id
  destination_cidr_block = var.IGW_cidr
  gateway_id = aws_internet_gateway.Eng_IGW.id
  depends_on = [aws_route_table.Eng_Pub_Route_Table]

}
