resource "aws_alb" "application-loadbalancer" {
  name               = var.LB_NAME
  load_balancer_type = "application"
  subnets            = var.PUBLIC_SUBNETS
  security_groups = ["${aws_security_group.loadbalancer-securitygroup.id}"]
}

resource "aws_security_group" "loadbalancer-securitygroup" {

  vpc_id = var.VPC_ID

  ingress {
    from_port   = 80 
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0             
    to_port     = 0             
    protocol    = "-1"         
    cidr_blocks = ["0.0.0.0/0"] 
  }

  tags = {
    "Name" = "allow-traffic-lb"
  }

}


# create a target on port 80
resource "aws_lb_target_group" "target-group" {
  name        = "target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.VPC_ID
  health_check {
    matcher = "200,301,302"
    path    = "/"
  }
}

# listen on port 80
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.application-loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
}