########## Webserver 1

resource "aws_instance" "web1" {
 ami            	= "ami-01f14919ba412de34"
 instance_type  	= "t2.micro"
 vpc_security_group_ids = [aws_security_group.web-sg.id]
 key_name	 	= "MacRSAPub2019"
 subnet_id      	= aws_subnet.web1.id
 user_data 		= file("install_apache_web1.sh")
 tags = {
        Name = "web-1"
 }
}

resource "aws_eip" "web1" {
 instance       	= aws_instance.web1.id
}

########## Webserver 2

resource "aws_instance" "web2" {
 ami            	= "ami-01f14919ba412de34"
 instance_type  	= "t2.micro"
 vpc_security_group_ids = [aws_security_group.web-sg.id]
 key_name 		= "MacRSAPub2019"
 subnet_id      	= aws_subnet.web2.id
 user_data 		= file("install_apache_web2.sh")
 tags = {
        Name = "web-2"
 }
}

resource "aws_eip" "web2" {
 instance       	= aws_instance.web2.id
}

########## Webserver 3

resource "aws_instance" "web3" {
 ami            	= "ami-01f14919ba412de34"
 instance_type  	= "t2.micro"
 vpc_security_group_ids = [aws_security_group.web-sg.id]
 key_name 		= "MacRSAPub2019"
 subnet_id      	= aws_subnet.web3.id
 user_data 		= file("install_apache_web3.sh")
 tags = {
        Name = "web-3"
 }
}

resource "aws_eip" "web3" {
 instance       	= aws_instance.web3.id
}


