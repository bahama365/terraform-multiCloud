########## Webserver 4

resource "aws_instance" "web4" {
 ami            	= "ami-05f37c3995fffb4fd"
 instance_type  	= "t2.micro"
 vpc_security_group_ids = [aws_security_group.web-sg.id]
 key_name	 	= "MacRSAPub2019"
 subnet_id      	= aws_subnet.web1.id
 user_data 		= file("install_apache_web4.sh")
 tags = {
        Name = "web-4"
 }
}

resource "aws_eip" "web4" {
 instance       	= aws_instance.web4.id
}

########## Webserver 5

resource "aws_instance" "web5" {
 ami            	= "ami-05f37c3995fffb4fd"
 instance_type  	= "t2.micro"
 vpc_security_group_ids = [aws_security_group.web-sg.id]
 key_name 		= "MacRSAPub2019"
 subnet_id      	= aws_subnet.web2.id
 user_data 		= file("install_apache_web5.sh")
 tags = {
        Name = "web-5"
 }
}

resource "aws_eip" "web5" {
 instance       	= aws_instance.web5.id
}

########## Webserver 6

resource "aws_instance" "web6" {
 ami            	= "ami-05f37c3995fffb4fd"
 instance_type  	= "t2.micro"
 vpc_security_group_ids = [aws_security_group.web-sg.id]
 key_name 		= "MacRSAPub2019"
 subnet_id      	= aws_subnet.web3.id
 user_data 		= file("install_apache_web6.sh")
 tags = {
        Name = "web-6"
 }
}

resource "aws_eip" "web6" {
 instance       	= aws_instance.web6.id
}


