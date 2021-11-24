
resource "aws_lb" "Eng_LB" {
  name               = "ELB"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Eng_Sec_Group.id]
  subnets            = [
      aws_subnet.Eng_Pub_Subnet1.id, 
      aws_subnet.Eng_Pub_Subnet2.id]

}

resource "aws_lb_target_group" "Eng_TG" {
  name     = "Eng-lb-TG"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = aws_vpc.Engineer_vpc.id
  
  health_check {
    path = "/"
  }
}

# listeners

resource "aws_lb_listener" "LB_listener"{
  load_balancer_arn = aws_lb.Eng_LB.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Eng_TG.arn
  }
}