resource "aws_lb" "terraform" {
  name               = "terraform"
  internal           = false
  load_balancer_type = "application"
  ip_address_type    = "ipv4"
  enable_http2	     = false
  subnets            = ["${aws_subnet.web1.id}", "${aws_subnet.web2.id}", "${aws_subnet.web3.id}"]
  security_groups    = ["${aws_security_group.alb-sg.id}"]

}

resource "aws_lb_target_group" "terraform" {
  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
  name        = "terraform"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.terraform.id
  target_type = "instance"
}

########## LB Target Group

resource "aws_lb_target_group_attachment" "tg-attachment1" {
  target_group_arn = aws_lb_target_group.terraform.id
  target_id        = aws_instance.web4.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg-attachment2" {
  target_group_arn = aws_lb_target_group.terraform.id
  target_id        = aws_instance.web5.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg-attachment3" {
  target_group_arn = aws_lb_target_group.terraform.id
  target_id        = aws_instance.web6.id
  port             = 80
}

########## LB Listener


resource "aws_lb_listener" "terraform_redirect" {
  load_balancer_arn = aws_lb.terraform.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "terraform" {
  load_balancer_arn = aws_lb.terraform.id
  port              = "443"
  protocol          = "HTTPS"
# ssl_policy        = "ELBSecurityPolicy-2016-08"
  ssl_policy	    = "ELBSecurityPolicy-FS-1-2-2019-08"
  certificate_arn   = "arn:aws:acm:eu-west-2:815309306384:certificate/999335da-fea0-4009-8c8e-2ab0b8e61ea9"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform.id
  }
}
