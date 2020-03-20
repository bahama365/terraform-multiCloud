resource "aws_security_group" "web-sg" {
 vpc_id = aws_vpc.terraform.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]
    security_groups = ["${aws_security_group.alb-sg.id}"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
 tags = {
        Name = "terraform"
 }
}

resource "aws_security_group" "alb-sg" {
 vpc_id = aws_vpc.terraform.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
 tags = {
        Name = "LB terraform"
 }
}


