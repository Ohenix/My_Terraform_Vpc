# SERVERS

resource "aws_instance" "Eng_server1" {
  ami           = "ami-0c0a1cc13a52a158f"  # us-west-2
  instance_type = var.ami_1
  availability_zone = var.zone2
  vpc_security_group_ids = [aws_security_group.Eng_Sec_Group.id]
  subnet_id = aws_subnet.Eng_Pub_Subnet1.id
  user_data = file ("install_apache.sh")

  tags = {
    name = "Eng_server1"
  }
  
}


resource "aws_instance" "Eng_server2" {
  ami           = "ami-0c0a1cc13a52a158f" # us-west-2
  instance_type = var.ami_2
  availability_zone = var.zone2
  vpc_security_group_ids = [aws_security_group.Eng_Sec_Group.id]
  subnet_id = aws_subnet.Eng_Pub_Subnet2.id
  user_data = file ("install_apache.sh")

  tags = {
    name = "Eng_server2"
  }
  
}