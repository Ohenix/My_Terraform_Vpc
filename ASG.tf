
resource "aws_autoscaling_group" "Eng_ASG" {
  name                      = "Eng_ASG"
  max_size                  = 4
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  launch_configuration = aws_launch_configuration.Eng_LC.name
  vpc_zone_identifier       = [
    aws_subnet.Eng_Pub_Subnet1.id, 
    aws_subnet.Eng_Pub_Subnet2.id]
}


#launch template
resource "aws_launch_configuration" "Eng_LC"{
  name_prefix   = "Launch_Conf"
  image_id      = "ami-0c0a1cc13a52a158f" 
  instance_type = "t2.micro"
  
  key_name = "EC 2 Tutorial"
  
  lifecycle {
    create_before_destroy = true
  }
}


